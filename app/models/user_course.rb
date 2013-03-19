class UserCourse < ActiveRecord::Base
  attr_accessible :bookmark, :course_id, :progress, :time_spent, :user_id
end
