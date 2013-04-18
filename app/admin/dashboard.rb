# ActiveAdmin.register_page "Dashboard" do

  # controller do
  #   skip_before_filter :authorize
  # end

  # menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

ActiveAdmin::Dashboards.build do

    section "Student Progress" do
      
      table_for Semester.first.users do |t|
        t.column("Name")            { |n| n.full_name }
        t.column("Progress")        { |n| number_to_percentage(n.overall_progress, precision: 0) }
        t.column("Past Due")        { |n| "#{n.past_due_courses(21).size} Past Due" }
        t.column("Select Students") { |n| check_box_tag('user_ids[]', n.id, false, :class => 'user_ids') }
        t.column("Last emailed")    { |n| n.last_emailed }
        t.column(button_to("New Email", new_admin_email_path, :method => :get, :id => 'test')) {}

      end
    end
end

#:html => { "data-method" => "get" }