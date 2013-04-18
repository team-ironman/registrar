class ChangeLastEmailedFromUsers < ActiveRecord::Migration
  def up
	remove_column :users, :last_emailed
	add_column :users, :last_emailed, :datetime	
  end

  def down
	remove_column :users, :last_emailed
	add_column :users, :last_emailed, :time
  end
end
