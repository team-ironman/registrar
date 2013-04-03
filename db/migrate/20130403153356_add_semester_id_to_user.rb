class AddSemesterIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :semester_id, :integer
  end
end