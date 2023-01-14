class PortfolioAsset < ApplicationRecord
  belongs_to :portfolio
  belongs_to :asset

  def calculate_purchase_price(unit_price)
    quantity * unit_price
  end
end
