class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :user_id
      t.string :email
      t.string :nickname
      t.string :password
      t.boolean :admin

      t.timestamps
    end
  end
end
