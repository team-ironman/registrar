class UserCourse < ActiveRecord::Base
  attr_accessible :bookmark, :course_id, :progress, :time_spent, :user_id

  belongs_to :user
  belongs_to :course

  # scope :codeschool, where :course_provider_id => 1

  def self.codeschool
    #creates a result set that is all CodeSchool user courses. 
    #This is a custom sql query. Also, the readonly(false) attribute 
    #overrides the default behavior of join results being read only.
    #Why? We need to figure this out.    
    joins(:course).where("courses.course_provider_id = ?", 1).readonly(false)
  end

  def self.codeschool_for_user(user)
    # this builds on self.codeschool to further limit it to specific user.
    self.codeschool.where(:user_id => user.id)
  end

    def self.treehouse
    joins(:course).where("courses.course_provider_id = ?", 2).readonly(false)
  end

  def self.treehouse_for_user(user)
    self.treehouse.where(:user_id => user.id)
  end

end
