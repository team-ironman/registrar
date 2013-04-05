class AddOrderColumnToSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
        t.string   "name"
        t.timestamps
    end

    add_column :subjects, :display_order, :integer, :default => 0 
  end
end
