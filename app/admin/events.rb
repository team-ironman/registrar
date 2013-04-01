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

  form do |f|
    f.inputs do
      f.input :event_type
      f.input :users, :as => :check_boxes, :multiple => true, :collection => User.all.sort_by {|u| u.last_name}
      f.input :name
      f.input :start_at
      f.input :end_at
      f.input :location
      f.input :address
    end
    f.buttons
  end

  

end
