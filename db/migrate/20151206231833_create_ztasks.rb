class CreateZtasks < ActiveRecord::Migration
  def change
    create_table :ztasks do |t|
      t.string :name
      t.integer :zproject_id

      t.timestamps null: false
    end
  end
end
