class CreateFunds < ActiveRecord::Migration
  def change
    create_table :funds do |t|
      t.string :name
      t.float :balance
      t.integer :age

      t.timestamps null: false
    end
  end
end
