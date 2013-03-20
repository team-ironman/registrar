class User < ActiveRecord::Base
  attr_accessible :codeschool_login, :email, :first_name, :treehouse_login, :phone_number, :last_name

  has_many :user_courses
  has_many :courses, through: :user_courses

  validates :first_name, :last_name, :phone_number, :email, :codeschool_login, :treehouse_login, :presence => true
  validates :first_name, :last_name, :phone_number, :email, :codeschool_login, :treehouse_login, :uniqueness => true
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/ 
  validates_format_of :phone_number, :with =>  /\d[0-9]\)*\z/

end
