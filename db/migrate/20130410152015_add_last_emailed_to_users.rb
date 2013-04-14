class AddLastEmailedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_emailed, :time
  end
end
