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
