def stock_picker(prices)
  delta = 0
  days = []

  prices.each_with_index do |price, day1|
    for day2 in day1..prices.length
      if prices[day2] != nil && delta > (price - prices[day2])
        delta = price - prices[day2] 
        days = [day1, day2]
      end
    end
  end

  days
end

stocks = [17,3,6,9,15,8,6,1,10]

p stock_picker(stocks)
# => [1, 4]
