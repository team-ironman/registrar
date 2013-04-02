ActiveAdmin.register User do
  menu :priority => 2
  index do
    column :id
    column (:full_name) {|student| (link_to student.full_name, admin_user_path(student)) }
    column :email
    column :phone_number
    column :treehouse_login
    column :codeschool_login
    default_actions
  end
  filter :first_name
  filter :last_name
  


  show :title => :first_name do
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
      row("Total Treehouse") { number_to_percentage user.student_treehouse_progress }
      row("Total CodeSchool") { number_to_percentage user.student_codeschool_progress }
      end
    end

end
