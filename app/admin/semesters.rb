ActiveAdmin.register Semester do
  menu :priority => 2
  config.sort_order = "start_asc"
  index do
    column :id
    column :name
    column :start
    column :end
    default_actions
  end
  filter :name  
end
