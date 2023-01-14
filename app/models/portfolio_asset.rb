class PortfolioAsset < ApplicationRecord
  belongs_to :portfolio
  has_many :assets


  def calculate_purchase_price(unit_price)
    quantity * unit_price
  end
end
