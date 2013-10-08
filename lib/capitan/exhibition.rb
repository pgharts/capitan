class Capitan::Exhibition

include Capitan::ObjectInitializer
include Capitan::ShowMethods

  attr_accessor :title, :production_name, :presenter_name, :presenter_phone,
              :production_id, :slug, :genre, :keywords, :display_on_district_calendar,
              :display_on_org_calendar, :status_id, :ticket_prices,
              :organization_id, :updated_at, :error, :show_detail_url, :buy_tickets_url,
              :group_sales_url, :season, :calendar_text, :description, :start_date,
              :end_date, :show_type, :thumbnail_image_url, :main_image_url, :capi_show_detail_url


  def self.get(id)
    connection = Capitan::Connection.new
    response = connection.invoke_with_path("exhibition/#{id}")
    Capitan::Exhibition.new(response)
  end

end