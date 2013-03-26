class ChangeColumnsInUserCourses < ActiveRecord::Migration
  def change
    change_column :user_courses, :progress, :integer, :default => 0
    change_column :user_courses, :treehouse_badges_completed, :integer, :default => 0
  end
end
