class Course < ActiveRecord::Base
  attr_accessible :estimated_time, :name, :subject_id, :url, :treehouse_badges

  belongs_to :subject
  has_many :user_courses
  has_many :users, through: :user_courses
  has_one :course_provider

  # def self.codeschool
  #   where(:course_provider_id => 1)
  # end
end
