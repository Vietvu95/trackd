class CreatePortfolioAssets < ActiveRecord::Migration[7.0]
  def change
    create_table :portfolio_assets do |t|
      t.references :portfolio, null: false, foreign_key: true
      t.references :asset, null: false, foreign_key: true
      t.float :quantity
      t.float :purchase_price

      t.timestamps
    end
  end
end
