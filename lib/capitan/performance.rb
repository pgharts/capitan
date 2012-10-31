class Capitan::Performance
  include Capitan::ObjectInitializer
  include Capitan::ShowMethods

  attr_accessor :start_date, :end_date, :created_at, :updated_at, :notes, :restaurant_performance_id,
                :parking_performance_id, :venue_id, :date, :id, :production_page_id,
                :mode_of_sale, :on_sale, :non_ticketed_event_page_id


end