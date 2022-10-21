# frozen_string_literal: true

require_relative 'main'

puts 'Function x + cos(x) with limits [-1, 4]:'
puts "Via lambda: #{trap_lambda(->(x) { x + Math.cos(x) }, -1, 4, 1000)}"
puts "Via yield: #{trap_yield(-1, 4, 1000) { |x| x + Math.cos(x) }}"

puts '==================='

puts 'Function tg(x + 1) / (x + 1) with limits [1, 2]:'
puts "Via lambda: #{trap_lambda(->(x) { Math.tan(x + 1) / (x + 1) }, 1, 2, 1000)}"
puts "Via yield: #{trap_yield(1, 2, 1000) { |x| Math.tan(x + 1) / (x + 1) }}"
