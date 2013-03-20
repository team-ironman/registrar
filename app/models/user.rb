class User < ActiveRecord::Base
  attr_accessible :codeschool_login, :email, :name, :treehouse_login, :course_id, :progress

  has_many :user_courses
  has_many :courses, through: :user_courses

	accepts_nested_attributes_for :user_courses

	def user_courses
		courses = UserCourse.where(:user_id => 1)
		user_courses = {}
		# raise courses.inspect
			courses.each do |course|
				user_courses[course.course_id] = course

			end
		return user_courses
	end

end