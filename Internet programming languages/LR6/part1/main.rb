# frozen_string_literal: true

def calc(eps, partition)
  i_counter = 0
  true_s = Math.log(2, Math::E)**2 / 2
  partition /= 2

  d = 1.0 / partition
  s = 0
  loop do
    s = 0
    partition *= 2
    d /= 2
    x = 1
    partition.times do
      s += Math.log(x, Math::E) / x
      x += d
    end

    s *= d
    i_counter += 1
    break if (s - true_s).abs < eps
  end

  [s, i_counter]
end
