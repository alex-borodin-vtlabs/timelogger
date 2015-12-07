class CreateZintervals < ActiveRecord::Migration
  def change
    create_table :zintervals do |t|
      t.integer :ztask_id
      t.datetime :zbegin
      t.datetime :zend

      t.timestamps null: false
    end
  end
end
