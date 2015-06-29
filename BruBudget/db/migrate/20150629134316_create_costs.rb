class CreateCosts < ActiveRecord::Migration
  def change
    create_table :costs do |t|
      t.string :name
      t.integer :user_id
      t.integer :price
      t.string :date

      t.timestamps null: false
    end
  end
end
