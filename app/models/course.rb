class Course < ActiveRecord::Base
  attr_accessible :estimated_time, :name, :subject_id, :url, :treehouse_badges

  belongs_to :subject
  has_many :user_courses
  has_many :users, through: :user_courses
  belongs_to :course_provider

  scope :week_one, where('days_due_before_class > 21')
  scope :week_two, where('days_due_before_class >= 15 AND days_due_before_class <= 21')
  scope :week_three, where('days_due_before_class >= 8 AND days_due_before_class <= 14')
  scope :week_four, where('days_due_before_class >= 1 AND days_due_before_class <= 7')

  # def self.codeschool
  #   where(:course_provider_id => 1)
  # end
end
