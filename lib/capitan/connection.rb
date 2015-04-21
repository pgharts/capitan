class Capitan::Connection
  require 'rest_client'
  require 'json'

  def initialize
    @config = load_config_file
  end

  def invoke_with_path(url, params = {})
    params[:api_key] = api_key
    response = get_response("#{base_url}/#{url}?#{hash_to_querystring(params)}")
    JSON.parse(response)
  end

  def invoke_with_full_url(url, params = {})
    params[:api_key] = api_key
    response = get_response("#{url}?#{hash_to_querystring(params)}")
    JSON.parse(response)
  end

  private

  def get_response(url)

    Rails.cache.fetch(url, expires_in: 60.minutes) do
      String.new(RestClient.get(url));
    end

  rescue RestClient::Unauthorized, SocketError => error
    capitan_error = Capitan::Exceptions::ConnectionError.new(error)
    capitan_error.set_backtrace(error.backtrace)
    raise capitan_error
  end

  def base_url
    @config["capitan"]["base_url"]
  end

  def api_key
    @config["capitan"]["api_key"]
  end

  def load_config_file
    YAML.load_file("#{Rails.root}/config/config.yml")[Rails.env]
  end

  def hash_to_querystring(hash)
    hash.keys.inject('') do |query_string, key|
      query_string << '&' unless key == hash.keys.first
      query_string << "#{URI.encode(key.to_s)}=#{URI.encode(hash[key])}"
    end
  end

end