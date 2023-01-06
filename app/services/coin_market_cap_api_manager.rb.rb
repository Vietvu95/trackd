class MarketStackApiManager
  def initialize(asset)
    @asset = asset
  end

  def get_data
      url = "http://api.marketstack.com/v1/eod?access_key=0f7424aef84ceea4f0ac1b4db80ec5c5&symbols=#{@asset}"
      assets_serialized = URI.open(url).read
      JSON.parse(assets_serialized)
  end
end
