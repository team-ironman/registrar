class AddTreeHouseBagdesCompletedToUserCourses < ActiveRecord::Migration
  def change
    add_column :user_courses, :treehouse_badges_completed, :integer
  end
end
