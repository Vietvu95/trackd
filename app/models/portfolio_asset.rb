class PortfolioAsset < ApplicationRecord
  belongs_to :portfolio
  belongs_to :asset

  def calculate_purchase_price(unit_price)
    quantity * unit_price
  end

  def get_current_price
    api_price = get_price_from_api
    if api_price.class == String
      return 'NA'
    else
      (api_price * quantity).round(2)
    end
  end

  def profit_and_loss
    current_price = get_current_price
    if current_price.class == String
      return 'NA'
    else
      (get_current_price - purchase_price).round(2)
    end
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
