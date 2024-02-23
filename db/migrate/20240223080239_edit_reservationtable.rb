class EditReservationtable < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :user_id, :integer
    add_column :reservations, :room_id, :integer
    add_index :reservations, :room_id
    add_column :reservations, :total_price, :float
  end
end
