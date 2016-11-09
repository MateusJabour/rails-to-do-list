class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    enable_extension "uuid-ossp"
    enable_extension "citext"

    create_table :users, id: :uuid do |t|
      t.text :name, null: false
      t.citext :email, null: false
      t.string :password_digest, null: false

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
  end
end
