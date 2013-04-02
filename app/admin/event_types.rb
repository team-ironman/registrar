ActiveAdmin.register EventType do
  menu :priority => 6
  config.sort_order = "name_asc"
  index do
    column :id
    column :name
    default_actions
  end  
end
