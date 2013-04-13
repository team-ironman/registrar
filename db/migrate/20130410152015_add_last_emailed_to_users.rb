class AddLastEmailedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_emailed, :date_time
  end
end
