class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :slug, limit: 100
      t.string :first_name, limit: 50
      t.string :last_name, limit: 50
      t.string :password_digest
      t.string :email, limit: 100
      t.boolean :admin, default: false

      t.timestamps null: false
    end
    add_index :users, :slug, unique: true
    add_index :users, :email, unique: true
  end
end
