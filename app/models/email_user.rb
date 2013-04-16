class EmailUser < ActiveRecord::Base
  attr_accessible :email_id, :user_id

  belongs_to :emails
  belongs_to :users

end
