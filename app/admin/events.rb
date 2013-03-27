ActiveAdmin.register Event do
  menu :priority => 5
  index do
    column :name
    column :location
    column :start_at
    column :end_at
    column :event_type
    default_actions
  end 


end
