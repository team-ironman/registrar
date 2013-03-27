class AddOrderColumnToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :display_order, :integer, :default => 0 
  end
end
