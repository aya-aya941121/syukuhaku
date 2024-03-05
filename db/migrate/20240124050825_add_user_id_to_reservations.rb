class AddUserIdToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :user_id, :integer
  end
  def up
    add_column :reservations, :user_id, :integer
  end

  def down
    remove_column :reservations, :user_id
  end
end
