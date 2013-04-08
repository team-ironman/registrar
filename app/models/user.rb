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
  after_create :setup_new_user

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
    scrape.codeschool_progress(self) if !codeschool_login.blank?
    scrape.treehouse_progress(self) if !treehouse_login.blank?
  end 

  def self.create_associations_all_users
    User.all.each do |user|
      user.create_associations
    end
  end

  def self.find_by_token(token)
    user = where(:token => token).first
    return "Invalid token" if user==nil 
    return "Token already used" if !user.token_date_accepted.blank? 
    return user
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

  def send_welcome_email
     Policer.welcome(self).deliver
  end


  def newly_enrolled?
    (Time.now - self.token_date_accepted) < 5
  end

  def send_get_started_email
    Policer.get_started(self).deliver
  end

  def week_one_courses
    UserCourse.includes(:course).where("courses.days_due_before_class > ? AND user_id = ?", 21, self.id)
  end

  def week_two_courses
    UserCourse.includes(:course).where("courses.days_due_before_class >= ? AND courses.days_due_before_class <= ? AND user_id = ?", 15, 21, self.id)
  end

  def week_three_courses
    UserCourse.includes(:course).where("courses.days_due_before_class >= ? AND courses.days_due_before_class <= ? AND user_id = ?", 8, 14, self.id)
  end

  def week_four_courses
    UserCourse.includes(:course).where("courses.days_due_before_class <= ? AND user_id = ?", 7, self.id)
  end

  private 
  require 'securerandom'
  
  def setup_token
    if self.new_record? && self.password_digest.blank?
      token = SecureRandom.hex
      self.password = token
      self.password_confirmation = token
      self.token = token
    end
  end

  def setup_new_user
    create_associations
    send_welcome_email if $GLOBAL_SETTINGS[:email_on_create_user] == true
  end
     


end
