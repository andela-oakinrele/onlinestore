class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :firstname, null: false
      t.string :lastname, null: false
      t.string :email, null: false
      t.string :password, null: false
      t.integer :role_id
      t.integer :store_id

      t.timestamps
    end
  end
end
