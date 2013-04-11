ActiveAdmin.register_page "Dashboard" do

  controller do
    skip_before_filter :authorize
  end

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content do

    panel "Student Progress" do
      table_for User.all.sort_by {|u| u.overall_progress} do
        column :full_name
        column "Overall Progress %" do |student|
          link_to (number_to_percentage student.overall_progress), admin_user_path(student)
        end
      end
    end

  end
end
