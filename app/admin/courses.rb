ActiveAdmin.register Course do
  menu :priority => 3
  config.sort_order = "name_asc"
  config.per_page = 50
  index do
    column :name
    column :subject
    column :course_provider
    column :url
    column :estimated_time
    default_actions
  end
  filter :name
  filter :subject
  filter :course_provider

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :subject
      f.input :course_provider
      f.input :url
      f.input :estimated_time, :label => "Estimated Hours to Complete"
    end
    f.actions
  end

  show do |event|
    attributes_table do
      row :name
      row :description
      row :subject
      row :course_provider
      row :url
      row :estimated_time
      row :treehouse_badges
    end
  end
end
