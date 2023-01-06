class StockApiManager
  def initialize(asset_stock)
    @asset_stock = asset_stock
  end

  def get_stock_data
      stock_url = "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=#{@asset_stock}&interval=5min&apikey=L73EE7ZUNUZ4DKW0"
      stock_serialized = URI.open(stock_url).read
      JSON.parse(stock_serialized)
  end
end
