class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.date :birthdate
      t.integer :salary
      t.string :education
      t.integer :admin_id
      t.string :password_digest

      t.timestamps
    end
    add_index :users, :email, unique: true
  end

end
