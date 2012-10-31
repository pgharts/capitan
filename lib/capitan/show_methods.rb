module Capitan
  module ShowMethods
    def performances
      @production_performances || []
    end

    def venue
      @production_venue
    end

    def performances=(performances_json)
      perfs = []
      performances_json.each do |performance_json|
        perfs << Capitan::Performance.new(performance_json)
      end
      @production_performances = perfs
    end

    def venue=(venue_hash)
      @production_venue = Capitan::Venue.new(venue_hash)
    end

    def alphabetical_title
      return "#{@title.gsub(/^The /, '')}, The" if @title.match(/^The /)
      @title
    end

  end
end