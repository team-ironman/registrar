class Event < ActiveRecord::Base
  attr_accessible :name, :location, :address, :start_at, :end_at, :event_type_id

  has_event_calendar

  belongs_to :event_type
end
