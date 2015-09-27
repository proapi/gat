require 'open-uri'
require 'nokogiri'

class Price
  class << self
    def get_price(type)
      case type
      when 1 then
        price_1
      when 2 then
        price_2
      when 3 then
        price_3
      else
        0
      end
    end

    private

    def price_1
      price = 0
      open('http://time.com') do |f|
        f.each_line do |line|
          price += line.count('a')
        end
      end
      price/100.0
    end

    def price_2
      price = 0
      open('https://ajax.googleapis.com/ajax/services/feed/find?v=1.0&q=news') do |f|
        f.each_line do |line|
          price += line.scan(/\\u003cb\\u003e/).count
        end
      end
      price
    end

    def price_3
      price = 0
      page  = Nokogiri::HTML(open('http://time.com'))
      page.traverse { |n| price += 1 if n.element? }
      price/100.0
    end
  end
end
