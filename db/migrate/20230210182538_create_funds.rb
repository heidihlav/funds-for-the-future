class CreateFunds < ActiveRecord::Migration[4.2]
  def change
    create_table :funds do |t|
      t.string :name
      t.float :balance
      t.integer :age
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
