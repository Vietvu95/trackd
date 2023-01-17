class PortfolioAsset < ApplicationRecord
  belongs_to :portfolio, dependent: :destroy
  belongs_to :asset

  def calculate_purchase_price(unit_price)
    quantity * unit_price
  end

  def get_current_price
    get_price_from_api
  end

  private

  def get_price_from_api
    begin
      api = MarketStackApiManager.new(asset.name)
      return api.get_price.to_f
    rescue => e
      error = "first api invalid"
    end
    if error == "first api invalid"
      begin
        api = CoinMarketCapApiManager.new(asset.name)
        return api.get_price.to_f
      rescue => e
        error = "second API invalid"
      end
   end
  end
end
