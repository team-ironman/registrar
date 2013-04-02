class AddSemesterIdToInvites < ActiveRecord::Migration
  def change
    add_column :invites, :semester_id, :integer
  end
end
