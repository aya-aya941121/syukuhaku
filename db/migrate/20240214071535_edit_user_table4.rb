class EditUserTable4 < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :encrypted_password, :string
    add_column :users, :introduction, :string
    remove_column :users, :password, :string
    remove_column :users, :password_confirmation, :string
  end
end
