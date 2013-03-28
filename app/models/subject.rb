class Subject < ActiveRecord::Base
  attr_accessible :name, :display_order, :description

  has_many :courses
  
end
