class Capitan::Shows

  def self.all(type = 'all')
    connection = Capitan::Connection.new
    response = connection.invoke_with_path("shows/#{type}")
    process_response(response)
  end

  def self.find(type, params)
    connection = Capitan::Connection.new
    response = connection.invoke_with_path("shows/search/#{search_type(type)}", params)
    process_response(response)
  end

  def self.types
    {
      :all => 'all',
      :productions => 'productions',
      :non_ticketed_events => 'events',
      :exhibitions => 'exhibitions'
    }

  end

  private

  def self.search_type(type)
    return "" if type == "all"
    type
  end

  def self.process_response(response_hash)
    shows = []
    response_hash.each do |show|
      shows << process_show(show)
    end
    shows
  end

  def self.process_show(show_hash)
    show = nil
    show = Capitan::Production.new(show_hash) if show_hash['show_type'] == "Production"
    show = Capitan::NonTicketedEvent.new(show_hash) if show_hash['show_type'] == "Non-Ticketed Event"
    show = Capitan::Exhibition.new(show_hash) if show_hash['show_type'] == "Exhibition"
    show
  end

end