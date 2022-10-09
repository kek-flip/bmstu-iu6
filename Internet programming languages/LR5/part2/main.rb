# frozen_string_literal: true

# class MyArray
class MyArray
  attr_reader :data

  def initialize(arr = [])
    @data = arr
  end

  def modify!
    data.each_index do |i|
      data.insert(i + 1, data[i]**2) if data[i].negative?
    end
  end
end
