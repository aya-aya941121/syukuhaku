class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.datetime :check_in_at, null: false
      t.datetime :check_out_at, null: false
      t.integer :people_count, null: false

      t.timestamps
    end
  end
end
