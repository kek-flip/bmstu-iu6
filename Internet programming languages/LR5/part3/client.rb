# frozen_string_literal: true

require_relative 'main'

puts 'Input number of strings:'
n = gets.to_i
n.times do
  puts 'Input string:'
  str = gets
  puts "Origing string: #{str}"
  puts "Corrected string: #{correct_string(str)}"
  puts "Number of wrong words: #{wrong_words_num(str)}"
  puts '==================='
end
