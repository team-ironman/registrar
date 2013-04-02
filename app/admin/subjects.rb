ActiveAdmin.register Subject do
  menu :priority => 4
  config.sort_order = "name_asc"
  index do
    column :name
    default_actions
  end
  filter :name  
end
