class UserCourse < ActiveRecord::Base
  attr_accessible :bookmark, :course_id, :progress, :time_spent, :user_id

  belongs_to :user
  belongs_to :course

  # scope :codeschool, where :course_provider_id => 1

  def self.codeschool
    joins(:course).where("courses.course_provider_id = ?", 1).readonly(false)
  end

  def self.codeschool_for_user(user)
    self.codeschool.where(:user_id => user.id)
  end

end
