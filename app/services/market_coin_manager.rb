require 'open-uri'

class MarketCoinManager

  def self.raw_data
    url = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=9da0f106-d8b3-4138-865c-09975e3c1f58"
    assets_serialized = URI.open(url).read
    JSON.parse(assets_serialized)
  end
end
