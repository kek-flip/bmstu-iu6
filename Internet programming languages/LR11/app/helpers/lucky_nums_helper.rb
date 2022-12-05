# frozen_string_literal: true

# Helper for LuckNums
module LuckyNumsHelper
  def calc_sum(num, left, right)
    sum = 0
    num[left, right].each_char { |c| sum += c.to_i }
    sum
  end

  def find_lucky_nums(num)
    lucky_nums = ''
    0.upto(num) do |i|
      i_str = i.to_s
      i_str.insert(0, '0' * (6 - i_str.length))
      lucky_nums += "#{i},#{calc_sum(i_str, 0, 3)} " if calc_sum(i_str, 0, 3) == calc_sum(i_str, 3, 6)
    end
    lucky_nums
  end
end
