class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false, limit: 10
      t.string :email, null: false
      t.string :password, null: false
      t.string :password_confirmation, null: false

      t.timestamps
    end
  end
end
