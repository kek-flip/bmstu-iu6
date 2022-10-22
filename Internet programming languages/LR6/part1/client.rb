# frozen_string_literal: true

require_relative 'main'

ans = calc(0.001, 10)

puts "Value with with an accuracy of 0.001: #{ans[0]}\n"
puts "Iterations count #{ans[1]}"

ans = calc(0.0001, 10)

puts "Value with with an accuracy of 0.0001: #{ans[0]}\n"
puts "Iterations count #{ans[1]}"
