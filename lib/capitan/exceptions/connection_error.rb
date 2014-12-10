module Exceptions
  class ConnectionError < StandardError

    def initialize(error)
      message = error.message
      message = socket_error_message if error.class == SocketError
      message = unauthorized_message if error.class == RestClient::Unauthorized
      super(message)
    end

    private

    def socket_error_message
      "Unable to connect to CAPI. Be sure that you have the correct base_url set in config.yml."
    end

    def unauthorized_message
      "Invalid API key. Make sure a valid key is set for api_key in config.yml."
    end

  end

end