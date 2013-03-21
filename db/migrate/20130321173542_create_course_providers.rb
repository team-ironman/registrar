class CreateCourseProviders < ActiveRecord::Migration
  def change
    create_table :course_providers do |t|
      t.string :name

      t.timestamps
    end
  end
end
