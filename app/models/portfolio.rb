class Portfolio < ApplicationRecord
  belongs_to :user
  has_many :portfolio_assets, dependent: :destroy

  def total_value
    total = 0
    self.portfolio_assets.each do |portfolio_asset|
      total += portfolio_asset.get_current_price
    end
    return total
  end

  def total_purchase_value
    total = 0
    self.portfolio_assets.each do |portfolio_asset|
      total += portfolio_asset.purchase_price
    end
    return total
  end
end
