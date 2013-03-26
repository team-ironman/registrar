ActiveAdmin.register Event do
  index do
    column :name
    column :location
    column :start_at
    column :end_at
    default_actions
  end 
end
