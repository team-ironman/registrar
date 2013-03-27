class AddDaysDueBeforeClassToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :days_due_before_class, :integer
  end
end
