class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :token
      t.boolean :token_used, :default => false 

      t.timestamps
    end
  end
end
