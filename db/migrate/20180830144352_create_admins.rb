class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :admin_id
      t.string :password_digest
      t.boolean :admin, default: true

      t.timestamps
    end
    add_index :admins, :email, unique: true
  end
end
