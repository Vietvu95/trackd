class Asset < ApplicationRecord
  has_many :portfolios

  def self.find_or_create_by_name(name)
    asset = Asset.find_by(name: name)
    if asset.nil?
      asset = Asset.new(name: name)
      asset.save!
    end
    asset
  end
end
