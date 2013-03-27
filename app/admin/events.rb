ActiveAdmin.register Event do
  index do
    column :name
    column :location
    column :start_at
    column :end_at
    column :event_type
    default_actions
  end 


end
