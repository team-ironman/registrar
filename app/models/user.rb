class User < ActiveRecord::Base
  require "open-uri"
  attr_accessible :codeschool_login, :email, :first_name, :treehouse_login, :phone_number, :last_name, :password, :password_confirmation

 # validates :first_name, :last_name, :phone_number, :email, :codeschool_login, :treehouse_login, :presence => true
 # validates :first_name, :last_name, :phone_number, :email, :codeschool_login, :treehouse_login, :uniqueness => true
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/ 
  validates_format_of :phone_number, :with =>  /\d[0-9]\)*\z/

  has_many :user_courses
  has_many :courses, through: :user_courses

	accepts_nested_attributes_for :user_courses

  has_secure_password

	def user_courses_hash
		courses = UserCourse.where(:user_id => 1)
		user_courses_hash = {}
		courses.each do |course|
			user_courses_hash[course.course_id] = course
		end
		return user_courses_hash
	end

  def add_course_to_user(course)
    self.user_courses.build(course_id: course.id, user_id: self.id, progress: 0, treehouse_badges_completed: 0).save
  end

  def create_associations
    courses = Course.all
    courses.each do |course|
      unless self.courses.include?(course)
        self.add_course_to_user(course)
      end
    end
  end

  def codeschool_progress
    login = self.codeschool_login
    cs_user_courses = UserCourse.codeschool_for_user(self)
    progress_hash = scrape_codeschool(login)
    cs_user_courses.each do |user_course|
      if progress_hash.has_key?(user_course.course.name.to_sym)
       user_course.progress = progress_hash[user_course.course.name.to_sym]
       user_course.save
      end
    end
  end


  # use scrape method to get hash of user progress
  def scrape_codeschool(login)

    url = "http://www.codeschool.com/users/#{login}"
    doc = Nokogiri::HTML(open(url))
    completed_course_list = {}
    completed_courses = doc.css("li.course.card-a.alt.course-complete a").map {|course| course.text}
    completed_courses.each do |course|
      completed_course_list[course.to_sym] = "100%"
    end
    incomplete_course_progress_list = {}
    incomplete_courses = (doc.css("li.course.card-a") - doc.css("li.course.card-a.alt.course-complete")).map {|course| course.inner_text.strip}
    incomplete_courses.each_with_index do |course, index|
      incomplete_course_progress_list[course.to_sym] = doc.css("div.course-progress")[index].attr("data-width")
    end
    progress = completed_course_list.merge(incomplete_course_progress_list)
  end




# match that to the keys in the progress hash progress[:name]

# set progress equal to value of progress_hash - 
# user_course.progress = progress[:name]

  def all_treehouse_badges
    login_to_treehouse
    #need an array of urls
    #iterate through array 
    urls_object = Course.select(:url).where(:course_provider_id => 2)
    urls = urls_object.map {|url| url.url }        
    urls.each do |url|
      doc = Nokogiri::HTML(open(url))
      data = doc.css("div.module-topper h3").text
      total_number_of_badges = data.split(" ").first
      total_number_of_videos = data.split(" ")[3]
      #save num of badges to course table
      course = Course.where(:url => url).first
      course.treehouse_badges = total_number_of_badges
      course.save
    end
  end


  def treehouse_progress
    login = self.treehouse_login
    th_user_courses = UserCourse.treehouse_for_user(User.first)
    progress_hash = scrape_treehouse(login)
    th_user_courses.each do |user_course|
      if progress_hash.has_key?(user_course.course.name.to_sym)
       user_course.treehouse_badges_completed = progress_hash[user_course.course.name.to_sym]
       user_course.progress = (user_course.treehouse_badges_completed.round(2) / user_course.course.treehouse_badges.round(2)) * 100
       user_course.save
      end
    end
  end

  def login_to_treehouse
    agent = Mechanize.new
    agent.get("http://www.teamtreehouse.com/login")
    form = agent.page.forms[1]
    form.fields[2].value = "avi@flatironschool.com"
    form.fields[3].value = "flatironschool"
    form.submit
  end

  def scrape_treehouse(login)
    login_to_treehouse
    url = "http://www.teamtreehouse.com/#{login}"
    doc = Nokogiri::HTML(open(url))
    all_courses = doc.css("p.light a").map {|course| course.text}
    #data is an array of course names
    unique_courses = all_courses.uniq
    #count each type of course name and save it to the completed badges in the user_course table
    progress = {}
    unique_courses.each do |course|
      progress[course.to_sym] = all_courses.count(course)
    end
    progress
  end

end
