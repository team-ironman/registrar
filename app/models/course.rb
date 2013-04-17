class Course < ActiveRecord::Base
  attr_accessible :estimated_time, :name, :subject_id, :url, :treehouse_badges, :course_provider_id, :days_due_before_class, :description

  belongs_to :subject
  has_many :user_courses, :dependent => :destroy
  has_many :users, through: :user_courses
  belongs_to :course_provider

  after_create :create_associations_all_users, :get_badge_count

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

  def self.courses_for_user(user_id)
    includes(:user_courses, :subject).order(:display_order).where("user_courses.user_id = #{user_id}").group_by { |c| c.subject.name }
  end
 
  def get_badge_count


    if self.course_provider && self.course_provider.name.downcase.strip == 'treehouse'
      Scrape.new.get_badge_count_for_treehouse_course(self.id)
    end
  end


  private
  def create_associations_all_users
    User.all.each do |user|
      user.add_course_to_user(self) 
    end
  end

end
