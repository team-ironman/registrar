class CourseProvider < ActiveRecord::Base
  attr_accessible :name

  has_many :courses
end
