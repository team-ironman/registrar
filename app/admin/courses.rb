ActiveAdmin.register Course do
  index do
    column :name
    column :url
    column :subject
    column :estimated_time
    column :course_provider
  end
  
end