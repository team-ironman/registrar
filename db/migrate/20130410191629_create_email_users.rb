class CreateEmailUsers < ActiveRecord::Migration
  def change
    create_table :email_users do |t|
      t.integer :email_id
      t.integer :user_id

      t.timestamps
    end
  end
end
