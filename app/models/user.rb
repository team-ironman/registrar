class User < ActiveRecord::Base
  attr_accessible :codeschool_login, :email, :name, :treehouse_login

  has_many :user_courses
  has_many :courses, through: :user_courses

end
