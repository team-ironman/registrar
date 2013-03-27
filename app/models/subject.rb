class Subject < ActiveRecord::Base
  attr_accessible :name, :display_order

  has_many :courses
  
end
