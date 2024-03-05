class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name, null: false, limit: 30
      t.string :description, null: false, limit: 300
      t.integer :price, null: false
      t.string :address, null: false, limiti: 50

      t.timestamps
    end
  end
end
