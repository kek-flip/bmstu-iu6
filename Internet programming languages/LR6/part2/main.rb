# frozen_string_literal: true

# Class to calc integral
class Calculator
  TRUE_SUM = Math.log(2, Math::E)**2 / 2

  def self.calc(eps, partition)
    i_counter = 0
    enum = make_enumerator(partition).drop_while do |sum|
      i_counter += 1
      (sum - TRUE_SUM).abs >= eps
    end
    [enum.first, i_counter]
  end

  def self.make_enumerator(partition)
    partition /= 2
    d = 1.0 / partition
    Enumerator::Lazy.new(0..Float::INFINITY) do |yielder, _|
      partition *= 2
      d /= 2
      yielder << (0..(partition - 1)).map { |x| 1 + x * d }.reduce(0) { |sum, el| sum + Math.log(el, Math::E) / el } * d
    end
  end

  private_class_method :make_enumerator
end
