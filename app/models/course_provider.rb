class CourseProvider < ActiveRecord::Base
  attr_accessible :name

  belongs_to :course
end
