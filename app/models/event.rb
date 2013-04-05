class Event < ActiveRecord::Base
  attr_accessible :name, :location, :address, :start_at, :end_at, :event_type_id, :user_ids

  has_event_calendar

  belongs_to :event_type

  has_many :user_events
  has_many :users, through: :user_events

  def self.all_other_events(user_id)
    Event.joins("LEFT JOIN user_events ON user_events.event_id = events.id").select("DISTINCT events.*").where("user_id = ? OR user_id IS ?", user_id, nil)
  end

end

#scope - events assigned to a user
#user.user_events