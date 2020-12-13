class AddAvailableQuantityToStocks < ActiveRecord::Migration[5.0]
  def change
    add_column :stocks, :quantity, :integer
  end
end
