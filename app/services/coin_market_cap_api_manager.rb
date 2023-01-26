require 'open-uri'

class CoinMarketCapApiManager
  attr_reader :data

  def initialize(assets)
    @assets = convert_assets_to_string(assets)
    @data = get_data
  end

  def get_name
   @assets
  end

  def get_price
    @data["data"][@assets.upcase]["quote"]["USD"]["price"]
  end

  def get_data
    url = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?symbol=#{@assets}&CMC_PRO_API_KEY=84214bea-a731-4f47-9cb3-4f9732b64607"
    puts "url ==============="
    puts url
    assets_serialized = URI.open(url).read
    JSON.parse(assets_serialized)
  end

  private

  def convert_assets_to_string(assets)
    if assets.kind_of?(Array)
      return assets.join(",")
    end
    return assets
  end
end
