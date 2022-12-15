class PortfolioAsset < ApplicationRecord
  belongs_to :portfolio
  has_many :assets
end
