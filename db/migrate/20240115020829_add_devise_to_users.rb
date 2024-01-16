# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[6.1]
  def self.up
    # emailカラムが存在しない場合のみ追加する
    unless column_exists?(:users, :email)
      add_column :users, :email, :string, null: false, default: ""
    end
  
    # 他のカラムの追加
    add_column :users, :encrypted_password, :string, null: false, default: ""
    add_column :users, :reset_password_token, :string
    add_column :users, :reset_password_sent_at, :datetime
    add_column :users, :remember_created_at, :datetime
  
    # インデックスの追加
    add_index :users, :email, unique: true
    add_index :users, :reset_password_token, unique: true
  end
  
  def self.down
    # マイグレーションをロールバックする際には、具体的なカラムの削除方法を指定する必要があります
    remove_column :users, :email
    remove_column :users, :encrypted_password
    remove_column :users, :reset_password_token
    remove_column :users, :reset_password_sent_at
    remove_column :users, :remember_created_at
  end
end
