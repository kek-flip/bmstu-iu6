# frozen_string_literal: true

require_relative 'main'

puts 'Input array size:'
n = gets.to_i
puts 'Input elements:'
arr = []
n.times { arr << gets.to_i }
my_arr = MyArray.new(arr)
my_arr.modify!
puts "Modified array: #{my_arr.data}"
