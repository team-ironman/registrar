class AddTreeHouseBagdesToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :treehouse_badges, :integer
  end
end
