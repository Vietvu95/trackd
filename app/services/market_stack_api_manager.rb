require 'open-uri'

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


  def get_data
    url = "http://api.marketstack.com/v1/eod?access_key=f13b6b51b2265c6228ff79b97fe691f8&symbols=#{@asset}"
    assets_serialized = URI.open(url).read
    JSON.parse(assets_serialized)
  end
end
