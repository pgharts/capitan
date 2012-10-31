class Capitan::Venue
  include Capitan::ObjectInitializer

  attr_accessor :title, :slug, :facility_phone, :street_address, :city, :state, :zip_code,
                :google_map_url, :short_description, :venue_id, :short_description, :facility_days_open

end