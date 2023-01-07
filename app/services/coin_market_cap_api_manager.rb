class CoinMarketCapApiManager
  def initialize(asset)
    @asset = asset
  end

  def get_data
      # url = "https://pro-api.coinmarketcap.com//v1/cryptocurrency/quotes/latest?symbol=#{@asset}&CMC_PRO_API_KEY=#{ENV['COINMARKETCAP_API_KEY']}']}"
      url = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?symbol=#{@asset}&CMC_PRO_API_KEY=5aa37e4d-a1ce-4f6e-8790-1dd89f569a5f"
      assets_serialized = URI.open(url).read
      JSON.parse(assets_serialized)
  end
end
