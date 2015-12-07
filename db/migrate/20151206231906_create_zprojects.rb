class CreateZprojects < ActiveRecord::Migration
  def change
    create_table :zprojects do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
