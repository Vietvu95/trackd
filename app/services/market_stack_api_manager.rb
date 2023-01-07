class MarketStackApiManager
  def initialize(asset)
    @asset = asset
  end

  def get_data
      url = "http://api.marketstack.com/v1/eod?access_key=5a412551932a7b898075d900d4adc5e3&symbols=#{@asset}"
      assets_serialized = URI.open(url).read
      JSON.parse(assets_serialized)
  end
end


# begin
#   @assets = CoinMarketCapApiManager.new(params[:query]).get_data
