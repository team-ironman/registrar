class User < ActiveRecord::Base
  attr_accessible :codeschool_login, :email, :name, :treehouse_login

  has_many :user_courses
  has_many :courses, through: :user_courses

	def user_courses
		courses = UserCourse.where(:user_id => 1)
		user_courses = {}
		
			courses.each do |course|
				user_courses[course.id] = course

			end
		return user_courses
	end

end