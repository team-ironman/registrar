ActiveAdmin.register Invite do
  menu :priority => 8
  index do
    column :id
    column :first_name
    column :last_name 
    column :email
    column :token
    column :token_used
    default_actions
  end
  filter :first_name
  filter :last_name
  
end