class AddUsersAndRoles < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email,           null: false
      t.string :password_digest, null: false
    end

    add_index :users, :email, unique: true

    create_table :roles do |t|
      t.string :name, null: false
    end

    add_index :roles, :name, unique: true

    create_table :user_roles do |t|
      t.integer :user_id, null: false
      t.integer :role_id, null: false
    end

    add_index :user_roles, [:user_id, :role_id], unique: true
  end
end
