# frozen_string_literal: true

# Simple house
class House
  attr_accessor :build_year, :area, :price

  def initialize(build_year, area, price)
    @build_year = build_year
    @area = area
    @price = price
  end

  def print_info
    puts "House was built in #{@build_year}"
    puts "It has an area of #{@area}"
    puts "Price: #{@price}"
  end
end

# Smart house that knows its one meter price
class SmartHouse < House
  def print_info
    super
    puts "One meter price: #{@price / @area}"
  end
end
