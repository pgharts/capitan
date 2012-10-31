module Capitan
  module Calendar
    class CalendarShow
      include Capitan::ObjectInitializer

      attr_accessor :presenter_name, :capi_show_detail_url, :show_detail_url, :title, :venue,
                    :date, :show_type, :calendar_text, :buy_tickets_url

      def show_type_class
        klass = nil
        klass = Capitan::Production if show_type == 'Production'
        klass = Capitan::NonTicketedEvent if show_type == 'Non-Ticketed Event'
        klass = Capitan::Exhibition if show_type == 'Exhibition'
        klass
      end

      def get_detail
        connection = Capitan::Connection.new
        response = connection.invoke_with_full_url(capi_show_detail_url)
        show_type_class.new(response)
      end

    end
  end
end