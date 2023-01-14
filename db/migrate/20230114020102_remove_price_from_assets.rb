class RemovePriceFromAssets < ActiveRecord::Migration[7.0]
  def change
    remove_column :assets, :price
  end
end
