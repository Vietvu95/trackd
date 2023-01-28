require 'open-uri'

class MarketStackManager

  def self.raw_data

    url = "http://api.marketstack.com/v1/exchanges?access_key=ad2efab16bf2cc8289f606d2a7633d25"
    assets_serialized = URI.open(url).read
    JSON.parse(assets_serialized)
  end

end
