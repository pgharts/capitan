module Capitan
  module ObjectInitializer
    def initialize(hash = {})
      @errors = []
      hash.each do |key, value|
        begin
          send("#{key}=", value)
        # If something passed in the API isn't defined for our model, log it and move on.
        rescue NoMethodError => error
          next
        end
      end
    end
  end
end