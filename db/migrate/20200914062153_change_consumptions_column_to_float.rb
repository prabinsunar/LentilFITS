class ChangeConsumptionsColumnToFloat < ActiveRecord::Migration[5.0]
  def change
    change_column :consumptions, :quantity, :float
  end
end
