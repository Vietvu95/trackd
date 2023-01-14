class CoinMarketCapApiManager
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
    url = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?symbol=#{@asset}&CMC_PRO_API_KEY=5aa37e4d-a1ce-4f6e-8790-1dd89f569a5f"
    assets_serialized = URI.open(url).read
    JSON.parse(assets_serialized)
  end

end
