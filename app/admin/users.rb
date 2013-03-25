ActiveAdmin.register User do
  index do
    column :id
    column :first_name
    column :last_name 
    column :email
    column :phone_number
    column :treehouse_login
    column :codeschool_login
  end
  
  # show do
  #   user.user_courses.each do |course|
  #     course.progress
  #   end
  # end

  show :title => :first_name do


    # panel "Summary" do
    #   table_for(user.user_courses) do
    #     column("Provider")                   {|provider| provider.course.course_provider_id }
    #     # column("Progress")                   {|course| course.progress }
    #   end
    # end
    panel "Student Progress" do
      table_for(user.user_courses) do
        column("Course", :sortable => :name) {|course| (link_to course.course.name, admin_course_path(course)) }
        column("Progress")                   {|course| course.progress }
        column("Subject")                    {|course| course.course.subject.name }
        column("Provider")                   {|course| course.course.course_provider_id }
      end
    end
    active_admin_comments

  end

  sidebar "Summary", :only => :show do
    attributes_table_for user do
      row("Total Treehouse") { number_to_percentage user.overall_treehouse_progress }
      row("Total CodeSchool") { number_to_percentage user.overall_codeschool_progress }
      end
    end

end
