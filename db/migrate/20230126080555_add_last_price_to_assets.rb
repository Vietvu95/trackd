class AddLastPriceToAssets < ActiveRecord::Migration[7.0]
  def change
    add_column :assets, :last_price, :float
  end
end
