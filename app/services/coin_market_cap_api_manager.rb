require 'open-uri'

class CoinMarketCapApiManager
  attr_reader :data

  def initialize(asset)
    @asset = asset
    @data = get_data
  end

  def get_name
   @asset
  end

  def get_price
    @data["data"][@asset.upcase]["quote"]["USD"]["price"]
  end

  private

  def get_data
    url = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?symbol=#{@asset}&CMC_PRO_API_KEY=84214bea-a731-4f47-9cb3-4f9732b64607"
    assets_serialized = URI.open(url).read
    JSON.parse(assets_serialized)
  end
end
