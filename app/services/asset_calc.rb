class AssetCalc

  def initialize
    @stocks = {}
    @cryptos = {}
  end

  def self.buy_stock(ticker, quantity, price)
    if @stocks[ticker]
      @stocks[ticker][:quantity] += quantity
      @stocks[ticker][:avg_price] = (@stocks[ticker][:avg_price] * (@stocks[ticker][:quantity] - quantity) + price * quantity) / @stocks[ticker][:quantity]
    else
      @stocks[ticker] = {quantity: quantity, avg_price: price}
    end
  end

  def self.sell_stock(ticker, quantity, price)
    if !@stocks[ticker] || @stocks[ticker][:quantity] < quantity
      raise "Invalid sell order"
    end

    @stocks[ticker][:quantity] -= quantity
    if @stocks[ticker][:quantity] == 0
      @stocks.delete(ticker)
    end
  end

  def self.buy_crypto(symbol, quantity, price)
    if @cryptos[symbol]
      @cryptos[symbol][:quantity] += quantity
      @cryptos[symbol][:avg_price] = (@cryptos[symbol][:avg_price] * (@cryptos[symbol][:quantity] - quantity) + price * quantity) / @cryptos[symbol][:quantity]
    else
      @cryptos[symbol] = {quantity: quantity, avg_price: price}
    end
  end

  def self.sell_crypto(symbol, quantity, price)
    if !@cryptos[symbol] || @cryptos[symbol][:quantity] < quantity
      raise "Invalid sell order"
    end

    @cryptos[symbol][:quantity] -= quantity
    if @cryptos[symbol][:quantity] == 0
      @cryptos.delete(symbol)
    end
  end

  def self.print_portfolio
    puts "Stocks:"
    @stocks.each do |ticker, stock|
      puts "#{ticker}: #{stock[:quantity]} shares @ $#{stock[:avg_price]}/share"
    end

    puts "\nCryptocurrencies:"
    @cryptos.each do |symbol, crypto|
      puts "#{symbol}: #{crypto[:quantity]} @ $#{crypto[:avg_price]}/unit"
    end
  end
end


#create_table "assets", force: :cascade do |t|
# t.string "name" API
# t.float "price" API
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
# end

# create_table "portfolio_assets", force: :cascade do |t|
# t.bigint "portfolio_id", null: false
# t.bigint "asset_id", null: false
# t.float "quantity" USER
# t.float "purchase_price" API
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
# t.index ["asset_id"], name: "index_portfolio_assets_on_asset_id"
# t.index ["portfolio_id"], name: "index_portfolio_assets_on_portfolio_id"
# end

#1) do migration to remove date bought from assets table
#2) move asset search to portfolio page#show- Need to draw portfolio_id from params to create portfolio_asset
#3) when displaying asset- add form field to enter quantity and add button to add asset to portfolio
#4) draw name and price from API call for asset from coinmarket cap API
#5)draw name and price from API call for asset from market stack API
#6) implement the purchase price calculation
#7) when clicking into add button creates a asset and portfolio_asset
