class Asset < ApplicationRecord
  has_many :portfolio_assets, dependent: :destroy


  def self.find_or_create_by_name(name, price)
    asset = Asset.find_by(name: name.upcase)
    if asset.nil?
      asset = Asset.new(name: name.upcase, last_price: price)
      asset.save!
    end
    if asset.updated_at > 1.minutes.ago
      asset.last_price = price
      asset.save!
    end
    asset
  end
end
