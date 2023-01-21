require 'open-uri'

class MarketStackManager

  def self.raw_data

    url = "http://api.marketstack.com/v1/exchanges?access_key=4cdb236e9b5ade65a446af2624309558"
    assets_serialized = URI.open(url).read
    JSON.parse(assets_serialized)
  end

end
