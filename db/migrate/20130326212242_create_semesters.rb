class CreateSemesters < ActiveRecord::Migration
  def change
    create_table :semesters do |t|
      t.date :start
      t.date :end
      t.string :name

      t.timestamps
    end
  end
end
