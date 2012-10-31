module Capitan
  module Calendar
    class Week

      attr_reader :week, :days

      def initialize(week_hash)
        @week = week_hash['week']
        @days = process_days(week_hash['days'])
      end


      private

      def process_days(days_hash)
        days = []
        days_hash.each do |day|
          days << Capitan::Calendar::Day.new(day)
        end
        days
      end

    end
  end
end