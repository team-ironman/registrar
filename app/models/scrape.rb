class Scrape
  require "open-uri"
  # include HTTParty

  def codeschool_progress(user)
    login = user.codeschool_login
    progress_hash = scrape_codeschool(login)

    user_courses = UserCourse.codeschool_for_user(user)
    user_courses.each do |user_course|
      if progress_hash.has_key?(user_course.course.name.to_sym)
       user_course.progress = progress_hash[user_course.course.name.to_sym]
       user_course.save
      end
    end
  end


  def treehouse_progress(user)
    login = user.treehouse_login
    progress_hash = scrape_treehouse(login)
    if progress_hash != false
      user_courses = UserCourse.treehouse_for_user(user)
      user_courses.each do |user_course|
        if progress_hash.has_key?(user_course.course.name.to_sym)
         user_course.treehouse_badges_completed = progress_hash[user_course.course.name.to_sym]
         user_course.progress = (user_course.treehouse_badges_completed.round(2) / user_course.course.treehouse_badges.round(2)) * 100
         user_course.save
        end

      end
    end
  end


  # gets the number of badges for each codeschool course
  def get_badge_count_for_treehouse_courses
    login_to_treehouse
    courses = Course.all_treehouse
    courses.each do |course|
      doc = Nokogiri::HTML(open(course.url))
      data = doc.css("div.module-topper h3").text
      total_number_of_badges = data.split(" ").first
      course.treehouse_badges = total_number_of_badges
      course.save
    end   
  end



  private

  # use scrape method to get hash of user progress
  def scrape_codeschool(login)
    url = "http://www.codeschool.com/users/#{login}"
    begin
      doc = Nokogiri::HTML(open(url))
    rescue => e
      Rails.logger.info "Oops! #{e}"
      Rails.logger.info "Attempted to scrape Codeschool with login #{login}"
      return false
    end
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
    completed_course_list.merge(incomplete_course_progress_list)
  end


  def login_to_treehouse
    agent = Mechanize.new
    agent.get("http://www.teamtreehouse.com/login")
    form = agent.page.forms[1]
    form.fields[2].value = "avi@flatironschool.com"
    form.fields[3].value = "flatironschool"
    form.submit
  end

  # def scrape_treehouse(login)
  #   login_to_treehouse
  #   url = "http://www.teamtreehouse.com/#{login}"
  #   doc = Nokogiri::HTML(open(url))
  #   all_courses = doc.css("p.light a:first").map {|course| course.text}
  #   #data is an array of course names
  #   unique_courses = all_courses.uniq
  #   #count each type of course name and save it to the completed badges in the user_course table
  #   progress = {}
  #   unique_courses.each do |course|
  #     progress[course.to_sym] = all_courses.count(course)
  #   end
  #   progress
  # end

  def scrape_treehouse(login)
    url = "http://www.teamtreehouse.com/#{login}"
    begin
      doc = Nokogiri::HTML(open(url))
    rescue => e
      Rails.logger.info "Oops! #{e}"
      Rails.logger.info "Attempted to scrape Treehouse with login #{login}"
      return false
    end

    all_courses = doc.css("p.light a:first").map {|course| course.text}
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