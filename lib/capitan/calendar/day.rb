module Capitan
  module Calendar
    class Day

      attr_accessor :day, :shows

      def initialize(day_hash)
        @day = Date.parse(day_hash['day'])
        @shows = process_shows(day_hash['shows'])
      end

      private

      def process_shows(shows_hash)
        shows = []
        shows_hash.each do |show|
          shows << Capitan::Calendar::CalendarShow.new(show)
        end
        shows
      end

    end
  end
end