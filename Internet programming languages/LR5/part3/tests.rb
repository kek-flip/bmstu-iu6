# frozen_string_literal: true

require_relative 'main'

RSpec.describe 'correct_string()' do
  it 'Words only of vowels' do
    vowels = %w[A a E e I i O o U u Y y]
    str = (1..rand(1..100)).map { vowels[rand(12)] }.join(' ')
    expect(correct_string(str)).to eq(str)
  end
  it 'Words only of consonants' do
    consonants = %w[B b C c D d F f G g H h J j K k L l M m N n P p Q q R r S s T t V v W w X x Z z]
    str = (1..rand(1..100)).map { consonants[rand(40)] }.join(' ')
    expect(correct_string(str)).to eq('')
  end
  it 'Random words' do
    str = (1..rand(1..100)).map { ('a'.ord + rand(26)).chr }.join(' ')
    expect(correct_string(str)).to eq(str.split(' ').select { |w| (w =~ /[AaEeIiOoUuYy]/).nil? == false }.join(' '))
  end
end

RSpec.describe 'wrong_words_num()' do
  it 'Words only of consonants' do
    consonants = %w[B b C c D d F f G g H h J j K k L l M m N n P p Q q R r S s T t V v W w X x Z z]
    str = (1..rand(1..100)).map { consonants[rand(40)] }.join(' ')
    expect(wrong_words_num(str)).to eq(str.split(' ').length)
  end
  it 'Words only of vowels' do
    vowels = %w[A a E e I i O o U u Y y]
    str = (1..rand(1..100)).map { vowels[rand(12)] }.join(' ')
    expect(wrong_words_num(str)).to eq(0)
  end
end
