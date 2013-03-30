ActiveAdmin.register Course do
  menu :priority => 3
  config.sort_order = "name_asc"
  config.per_page = 50
  index do
    column :name
    column :subject
    column :course_provider
    column :url
    column :estimated_time
    default_actions
  end
  filter :name
  filter :subject
  filter :course_provider
end
