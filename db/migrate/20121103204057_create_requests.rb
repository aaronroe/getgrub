class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :location
      t.string :target
      t.datetime :time_min
      t.datetime :time_max
      t.integer :fee
      t.boolean :isOpen

      t.timestamps
    end
  end
end
