# frozen_string_literal: true

require_relative 'main'

ans = Calculator.calc(0.001, 10)

puts "Value with with an accuracy of 0.001: #{ans.last}\n"
puts "Iterations count #{ans.length}"

ans = Calculator.calc(0.0001, 10)

puts "Value with with an accuracy of 0.0001: #{ans.last}\n"
puts "Iterations count #{ans.length}"
