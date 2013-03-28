class ChangeCourseColumnDescription < ActiveRecord::Migration
  def up
    change_column :courses, :description, :text, :limit => '65535'
  end
  def down
    change_column :courses, :description, :string
  end
end
