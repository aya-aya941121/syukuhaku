class AddTotalPriceToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :total_price, :float
  end
end
