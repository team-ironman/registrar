class CreateUserCourses < ActiveRecord::Migration
  def change
    create_table :user_courses do |t|
      t.integer :course_id
      t.integer :user_id
      t.integer :progress
      t.string :bookmark
      t.string :time_spent

      t.timestamps
    end
  end
end
