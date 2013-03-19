class User < ActiveRecord::Base
  attr_accessible :codeschool_login, :email, :name, :treehouse_login
end
