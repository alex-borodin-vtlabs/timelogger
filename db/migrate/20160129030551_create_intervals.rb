class CreateIntervals < ActiveRecord::Migration
  def change
    create_table :intervals do |t|
      t.datetime :intrvlbegin
      t.datetime :intrvlend
      t.integer :task_id

      t.timestamps null: false
    end
  end
end
