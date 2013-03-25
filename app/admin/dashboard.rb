ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content do

    panel "Student Progress" do
      table_for User.all.sort_by {|u| u.overall_progress} do
        column :first_name, :sortable => "first_name"
        column :last_name
        column "Overall Progress %", :sortable => ".overall_progress" do |student|
          link_to (number_to_percentage student.overall_progress), admin_user_path(student)
        end
      end
    end

  end
end
