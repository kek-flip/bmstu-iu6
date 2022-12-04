module LuckyNumsHelper
  def calc_sum(num, left, right)
    sum = 0
    num[left, right].each_char { |c| sum += c.to_i }
    sum
  end
end
