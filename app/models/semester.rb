class Semester < ActiveRecord::Base
  attr_accessible :end, :name, :start

  has_many :users

end
