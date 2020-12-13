class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.string :name
      t.string :category
      t.integer :quantity
      t.text :description

      t.timestamps
    end
  end
end
