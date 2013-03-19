class Course < ActiveRecord::Base
  attr_accessible :estimated_time, :name, :subject_id, :url
end
