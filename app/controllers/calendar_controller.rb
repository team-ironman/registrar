class CalendarController < ApplicationController
  
  def index
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i

    @shown_month = Date.civil(@year, @month)

    user_id = session[:user_id]
    # users_events = UserEvent.events_for_user(user_id)
    non_user_events = Event.all_other_events(user_id)
    # event_stripa = users_events.event_strips_for_month(@shown_month)
    @event_strips = non_user_events.event_strips_for_month(@shown_month)

    # @event_strips = event_stripa + event_stripb

  end
  
end
