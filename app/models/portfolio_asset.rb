class PortfolioAsset < ApplicationRecord
  attr :name

  belongs_to :portfolio
  belongs_to :asset

  before_create :set_purchase_price

  def calculate_purchase_price
    price = get_price_from_api
    if price
      quantity * price
    else
      self.errors.add(:base, "API broke when calculating price")
    end
  end

  def get_current_price
    api_price = get_price_from_api
    if api_price.class == String
      return nil
    else
      (api_price * quantity).round(2)
    end
  end

  def profit_and_loss
    current_price = get_current_price
    if current_price.class == String
      return nil
    else
      (get_current_price - purchase_price).round(2)
    end
  end

  private


  def set_purchase_price
    self.purchase_price = calculate_purchase_price
  end

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
        return nil
      end
   end
  end
end
