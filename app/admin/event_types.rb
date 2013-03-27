ActiveAdmin.register EventType do
  menu :priority => 6
  index do
    column :id
    column :name
    default_actions
  end  
end
