class AddEmailPasswordToUser < ActiveRecord::Migration
  def change
    add_column :users, :email, :string
    add_column :users, :password_hash, :string
    add_column :users, :password_salt, :string

    add_column :users, :avatar_url, :string
  end
end
