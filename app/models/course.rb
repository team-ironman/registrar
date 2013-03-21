class Course < ActiveRecord::Base
  attr_accessible :estimated_time, :name, :subject_id, :url

  belongs_to :subject
  has_many :user_courses
  has_many :users, through: :user_courses
  has_one :course_provider

end
