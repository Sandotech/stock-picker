# frozen_string_literal: true

# Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day.
# It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.

# You need to buy before you can sell
# Pay attention to edge cases like when the lowest
# day is the last day or the highest day is the first day.

def stock_picker(stock_prices)
  buy_day = 0
  sell_day = 0
  unable_days = Array(stock_prices)

  return nil if !stock_prices || stock_prices.empty?

  stock_prices.each_with_index do |price, day|
    if price < buy_day || buy_day.zero? # Best day to buy
      buy_day = day
      unable_days.shift buy_day
    end

    # Best day to sell after the bought

    sell_day = day if price > sell_day && day > buy_day && (price > unable_days[sell_day])
  end
  sell_day += 1
  [buy_day, sell_day]
end
