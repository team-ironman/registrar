ActiveAdmin.register Subject do
  menu :priority => 4
  index do
    column :name
    default_actions
  end
  filter :name  
end
