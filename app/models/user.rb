class User < ActiveRecord::Base
  attr_accessible :codeschool_login, :email, :first_name, :treehouse_login, :phone_number, :last_name, :password, :password_confirmation, :token, :semester_id
  # validates :first_name, :last_name, :phone_number, :email, :codeschool_login, :treehouse_login, :presence => true
  # validates :first_name, :last_name, :phone_number, :email, :codeschool_login, :treehouse_login, :uniqueness => true
  # validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/ 
  # validates_format_of :phone_number, :with =>  /\d[0-9]\)*\z/

  has_many :user_courses, :dependent => :destroy
  has_many :courses, through: :user_courses

  has_many :user_events, :dependent => :destroy
  has_many :events, through: :user_events

  belongs_to :semester

	accepts_nested_attributes_for :user_courses

  has_secure_password

  before_validation :setup_token
  after_create :setup_new_user, :send_welcome_email

  def overall_progress
    courses = self.user_courses
    average(progress_array(courses)).round(0)
  end

  def student_treehouse_progress
    courses = UserCourse.treehouse_for_user(self)
    average(progress_array(courses))
  end

  def student_codeschool_progress
    courses = UserCourse.codeschool_for_user(self)
    average(progress_array(courses))
  end

  def progress_array(user)
    user.select(:progress).map {|obj| obj.progress}
  end

  def average(array)
    array.inject{ |sum, el| sum + el }.to_f / array.size
  end

  def update_progress
    scrape = Scrape.new
    scrape.codeschool_progress(self)
    scrape.treehouse_progress(self)
  end 

  def self.create_associations_all_users
    User.all.each do |user|
      user.create_associations
    end
  end

  def create_associations
    courses = Course.all.reject { |course| self.courses.include?(course) }
    courses.each { |course| add_course_to_user(course) }
  end

  def add_course_to_user(course)
    self.user_courses.build(:course_id => course.id).save
  end

  def full_name
    [first_name, last_name].join(' ')
  end

  # def full_name=(name)
  #   split = name.split(' ',2)
  #   self.first_name = split.first
  #   self.last_name = split.last
  # end

  private 
  require 'SecureRandom'
  
  def setup_token
    if self.new_record? && self.password_digest != '' 
      token = SecureRandom.hex
      self.password_digest=token
      self.token=token
    end
  end

  def setup_new_user
    create_associations
  end
     
  def send_welcome_email
    if $GLOBAL_SETTINGS['email_on_create_user'] == true
     Policer.welcome(self).deliver
    end
  end

end
