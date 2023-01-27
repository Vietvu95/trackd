require 'open-uri'

class MarketStackManager

  def self.raw_data

    url = "http://api.marketstack.com/v1/exchanges?access_key=f13b6b51b2265c6228ff79b97fe691f8"
    assets_serialized = URI.open(url).read
    JSON.parse(assets_serialized)
  end

end
