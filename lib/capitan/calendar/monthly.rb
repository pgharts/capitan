module Capitan
  module Calendar

    class Monthly

      attr_reader :month, :year, :weeks

      def initialize(year, month)
        url = "calendar/monthly/#{year}/#{month}"
        connection = Capitan::Connection.new
        response = connection.invoke_with_path(url)
        process_response(response)
      end

      private

      def process_response(response)
        @month = response['month']
        @year = response['year']
        @weeks = process_weeks(response['weeks'])
      end

      def process_weeks(weeks_hash)
        weeks = []
        weeks_hash.each do |week|
          weeks << Capitan::Calendar::Week.new(week)
        end
        weeks
      end

    end
  end
end