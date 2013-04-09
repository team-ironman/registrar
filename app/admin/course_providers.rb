ActiveAdmin.register CourseProvider do
  menu :priority => 4
  config.sort_order = "id_asc"
  index do
    column :id
    column :name
    default_actions
  end
  filter :name  
end
