class ChangeStockColumnToFloat < ActiveRecord::Migration[5.0]
  def change
    change_column :stocks, :quantity, :float
  end
end
