class EditUserTable2 < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :encrypted_password, :string
    remove_column :users, :password, :string
    remove_column :users, :password_confirmation, :string
  end
end
