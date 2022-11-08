# frozen_string_literal: true

def calc(eps, partition)
  i_counter = 0
  true_sum = Math.log(2, Math::E)**2 / 2
  partition /= 2

  d = 1.0 / partition
  sum = 0
  loop do
    sum = 0
    partition *= 2
    d /= 2
    x = 1
    partition.times do
      sum += Math.log(x, Math::E) / x
      x += d
    end

    sum *= d
    i_counter += 1
    break if (sum - true_sum).abs < eps
  end

  [sum, i_counter]
end
