class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.integer :message_id
      t.datetime :date_sent
      t.string :conents

      t.timestamps
    end
  end
end
