# frozen_string_literal: true

def trap_lambda(func, left_limit, right_limit, partition)
  sum = 0.0
  d = (right_limit.to_f - left_limit) / partition
  x = left_limit + d

  (partition - 1).times do
    sum += (func.call(x) + func.call(x - d)) / 2
    x += d
  end

  sum *= d
end

def trap_yield(left_limit, right_limit, partition)
  sum = 0.0
  d = (right_limit.to_f - left_limit) / partition
  x = left_limit + d

  (partition - 1).times do
    sum += ((yield x) + (yield x - d)) / 2
    x += d
  end

  sum *= d
end
