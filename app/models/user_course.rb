class UserCourse < ActiveRecord::Base
  attr_accessible :bookmark, :course_id, :progress, :time_spent, :user_id, :treehouse_badges_completed

  belongs_to :user
  belongs_to :course

  scope :incomplete, where('progress < 100')

  def self.past_due_courses(day)
    includes(:course).where("progress < 100 AND courses.days_due_before_class > ?",day)
  end

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
    includes(:course => :subject).where(:user_id => user_id).order('subjects.display_order')
  end

  def time_elapsed
    if self.time_spent.nil?
      0
    else
      seconds = self.time_spent.to_i
    end
  end

  def secondstohms
    if self.time_spent.nil?
      "00:00:00"
    else
      seconds = self.time_spent.to_i
      Time.at(seconds).utc.strftime("%H:%M:%S")
    end
  end

end


