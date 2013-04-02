class UserEvent < ActiveRecord::Base
  attr_accessible :event_id, :user_id

  belongs_to :event
  belongs_to :user

  def self.events_for_user(user_id)
    Event.joins(:user_events).where('user_events.user_id' => user_id)
  end

end
