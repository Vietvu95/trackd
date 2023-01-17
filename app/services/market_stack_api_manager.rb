class MarketStackApiManager
  attr_reader :data

  def initialize(asset)
    @asset = asset
    @data = get_data
  end

  def get_name
    @asset
  end

  def get_price
    @data["data"][0]["close"]
  end

  private

  def get_data
    url = "http://api.marketstack.com/v1/eod?access_key=3e4c961531fa3231b82a8b3fe6a52db1&symbols=#{@asset}"
    assets_serialized = URI.open(url).read
    JSON.parse(assets_serialized)
  end

end
