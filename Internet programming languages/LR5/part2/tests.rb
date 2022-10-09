# frozen_string_literal: true

require_relative 'main'

RSpec.describe MyArray do
  context 'Test modify! method' do
    it 'Random array' do
      n = rand(100)
      my_arr_data = []
      arr = []
      n.times do
        a = rand(100).even? ? rand(100) : rand(100) * -1
        my_arr_data << a
        arr << a
        arr << a**2 if a.negative?
      end
      my_arr = MyArray.new(my_arr_data)
      my_arr.modify!
      expect(my_arr.data).to eq(arr)
    end

    it 'Empty array' do
      my_arr = MyArray.new([])
      my_arr.modify!
      expect(my_arr.data).to eq([])
    end

    it 'Only positive nums' do
      arr = Array.new(rand(100)) { rand(100) }
      my_arr = MyArray.new(arr)
      my_arr.modify!
      expect(my_arr.data).to eq(arr)
    end

    it 'Only negative nums' do
      my_arr_data = Array.new(rand(100)) { rand(1..100) * -1 }
      arr = []
      my_arr_data.each do |n|
        arr << n
        arr << n**2
      end
      my_arr = MyArray.new(my_arr_data)
      my_arr.modify!
      expect(my_arr.data).to eq(arr)
    end
  end
end
