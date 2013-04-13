class Email < ActiveRecord::Base
  attr_accessible :body, :subject

  has_many :email_users, :dependent => :destroy
  has_many :users, through: :email_users

end
