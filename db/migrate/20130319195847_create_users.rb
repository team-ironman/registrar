class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :codeschool_login
      t.string :treehouse_login

      t.timestamps
    end
  end
end
