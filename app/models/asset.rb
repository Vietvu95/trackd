class Asset < ApplicationRecord
  has_many :portfolio_assets, dependent: :destroy


  def self.find_or_create_by_name(name)
    asset = Asset.find_by(name: name.upcase)
    if asset.nil?
      asset = Asset.new(name: name.upcase)
      asset.save!
    end
    asset
  end
end
