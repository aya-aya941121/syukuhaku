class AddRoomIdToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :room_id, :integer
    add_index :reservations, :room_id
  end
end
