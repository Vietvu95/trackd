lass PortfolioAsset < ApplicationRecord
  belongs_to :portfolio
  belongs_to :asset

  def calculate_purchase_price(unit_price)
    quantity * unit_price
  end

  def get_current_price
    if asset.updated_at > 1.minutes.ago
      return (asset.last_price * quantity).round(2)
    end
    api_price = get_price_from_api
    if api_price.class == String
      return (asset.last_price * quantity).round(2)
    else
      asset.update!(last_price: api_price)
      return (api_price * quantity).round(2)
    end
  end

  def profit_and_loss
    (get_current_price - purchase_price).round(2)
  end

  private

  def get_price_from_api
    begin
      api = CoinMarketCapApiManager.new(asset.name)
      return api.get_price.to_f
    rescue => e
      error = "first api invalid"
    end
    if error == "first api invalid"
      begin
        api = MarketStackApiManager.new(asset.name)
        return api.get_price.to_f
      rescue => e
        error = "second API invalid"
      end
   end
  end
end
