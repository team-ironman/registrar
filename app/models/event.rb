class Event < ActiveRecord::Base
  attr_accessible :name, :location, :address, :start_at, :end_at

  has_event_calendar
end
