# frozen_string_literal: true

# def calc(eps, partition)
#   true_s = Math.log(2, Math::E)**2 / 2
#   partition /= 2
#   d = 1.0 / partition
#   Enumerator::Lazy.new(0..Float::INFINITY) do |yielder, _|
#     s = 0
#     partition *= 2
#     d /= 2
#     x = 1
#     partition.times do
#       s += Math.log(x, Math::E) / x
#       x += d
#     end
#     s *= d
#     yielder << s
#   end.take_while { |s| (s - true_s).abs >= eps }.to_a
# end

# Class to cacl integral
class Calculator
  TRUE_S = Math.log(2, Math::E)**2 / 2

  def self.make_enumerator(partition)
    partition /= 2
    d = 1.0 / partition
    Enumerator::Lazy.new(0..Float::INFINITY) do |yielder, _|
      partition *= 2
      d /= 2
      yielder << (0..(partition - 1)).map { |i| 1 + i * d }.reduce(0) { |sum, el| sum + Math.log(el, Math::E) / el } * d
    end
  end

  def self.calc(eps, partition)
    make_enumerator(partition).take_while { |s| (s - TRUE_S).abs < eps }.to_a
  end
end
