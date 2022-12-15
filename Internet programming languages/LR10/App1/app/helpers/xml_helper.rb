# frozen_string_literal: true

# Helper for controller
module XmlHelper
  def calc_sum(num, left, right)
    sum = 0
    num[left, right].each_char { |c| sum += c.to_i }
    sum
  end

  def find_lucky_nums(num)
    lucky_nums = {}
    0.upto(num) do |i|
      i_str = i.to_s
      i_str.insert(0, '0' * (6 - i_str.length))
      l_sum = calc_sum(i_str, 0, 3)
      r_sum = calc_sum(i_str, 3, 6)
      lucky_nums[i] = l_sum if l_sum == r_sum
    end
    lucky_nums
  end
end
