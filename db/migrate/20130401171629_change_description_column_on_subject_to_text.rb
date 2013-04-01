class ChangeDescriptionColumnOnSubjectToText < ActiveRecord::Migration
  def up
    change_column :subjects, :description, :text
  end

  def down
    change_column :subjects, :description, :string
  end
end
