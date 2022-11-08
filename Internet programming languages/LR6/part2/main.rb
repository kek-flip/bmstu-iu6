# frozen_string_literal: true

# Class to cacl integral
class Calculator
  TRUE_SUM = Math.log(2, Math::E)**2 / 2

  def self.calc(eps, partition)
    make_enumerator(partition).take_while { |sum| (sum - TRUE_SUM).abs >= eps }.to_a
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
