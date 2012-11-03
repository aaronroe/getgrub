class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :location
      t.string :target
      t.datetime :time_min
      t.datetime :time_max
      t.integer :fee
      t.string :item
      t.boolean :isOpen

      # requests can either belong to its owner, or to both a job and its owner
      t.integer :user_id
      t.integer :job_id

      t.timestamps
    end
  end
end
