class User < ActiveRecord::Base
  attr_accessible :codeschool_login, :email, :first_name, :treehouse_login, :phone_number, :last_name

  validates :first_name, :last_name, :phone_number, :email, :codeschool_login, :treehouse_login, :presence => true
  validates :first_name, :last_name, :phone_number, :email, :codeschool_login, :treehouse_login, :uniqueness => true
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/ 
  validates_format_of :phone_number, :with =>  /\d[0-9]\)*\z/

  has_many :user_courses
  has_many :courses, through: :user_courses

	accepts_nested_attributes_for :user_courses

	def user_courses_hash
		courses = UserCourse.where(:user_id => 1)
		user_courses_hash = {}
		courses.each do |course|
			user_courses_hash[course.course_id] = course
		end

		return user_courses_hash
	end

  def add_course_to_user(course_id)
    # @TODO change to logged in user
    user = User.find(1)

    user.user_courses.build(course_id: course_id, user_id: 1, progress: 0).save
    
  end


end




