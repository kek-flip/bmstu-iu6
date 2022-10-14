# frozen_string_literal: true

require_relative 'main'

RSpec.describe 'correct_string()' do
  it 'Words only of vowels' do
    vowels = %w[A a E e I i O o U u Y y]
    str = (1..rand(1..100)).map { vowels[rand(12)] }.join(' ')
    expect(correct_string(str)).to eq(str)
  end
  it 'Random words' do
    str = (1..rand(1..100)).map { ('a'.ord + rand(26)).chr }.join(' ')
    expect(correct_string(str)).to eq(str.split(' ').select { |w| (w =~ /[AaEeIiOoUuYy]/).nil? == false }.join(' '))
  end
end

RSpec.describe 'wrong_words_num()' do
  it 'Random words' do
    str = (1..rand(1..100)).map { ('a'.ord + rand(26)).chr }.join(' ')
    expect(wrong_words_num(str)).to eq(str.split(' ').select { |w| (w =~ /[AaEeIiOoUuYy]/).nil? }.length)
  end
end
