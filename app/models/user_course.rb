class UserCourse < ActiveRecord::Base
  attr_accessible :bookmark, :course_id, :progress, :time_spent, :user_id, :treehouse_badges_completed

  belongs_to :user
  belongs_to :course

  def self.codeschool
    #creates a result set that is all CodeSchool user courses. Using includes will do
    #eager loading, so if the result is used in an iterator it has all the info it needs,
    #therefore uses less SQL queries. Using "select('*')" will return a non-readonly object.
    includes(:course).select('*').where('courses.course_provider_id' => 1)
  end

  def self.codeschool_for_user(user)
    # this builds on self.codeschool to further limit it to specific user.
    self.codeschool.where(:user_id => user.id)
  end

  def self.treehouse
    includes(:course).select('*').where('courses.course_provider_id' => 2)
  end

  def self.treehouse_for_user(user)
    self.treehouse.where(:user_id => user.id)
  end

  def self.all_for_user(user_id)
    includes(:course => :subject).where(:user_id => user_id)
  end

end


