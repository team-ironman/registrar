class Course < ActiveRecord::Base
  attr_accessible :estimated_time, :name, :subject_id, :url, :treehouse_badges, :course_provider_id, :days_due_before_class

  belongs_to :subject
  has_many :user_courses
  has_many :users, through: :user_courses
  belongs_to :course_provider

  after_create :create_associations_all_users

  scope :week_one, where('days_due_before_class > 21')
  scope :week_two, where('days_due_before_class >= 15 AND days_due_before_class <= 21')
  scope :week_three, where('days_due_before_class >= 8 AND days_due_before_class <= 14')
  scope :week_four, where('days_due_before_class >= 1 AND days_due_before_class <= 7')

  def self.all_treehouse
    provider = CourseProvider.where(:name => 'treehouse').limit(1)
    where(:course_provider_id => provider.first.id)
  end

  def self.all_codeschool
    provider = CourseProvider.where(:name => 'code school').limit(1)
    where(:course_provider_id => provider.first.id)
  end

  def self.update_treehouse_badges
    all_treehouse_badges
  end

  private
  def create_associations_all_users
    User.all.each do |user|
      user.add_course_to_user(self) 
    end
  end

end
