# frozen_string_literal: true

require_relative 'main'
require 'minitest/autorun'

# Test class
class CaclTest < Minitest::Test
  TRUE_SUM = Math.log(2, Math::E)**2 / 2

  def test_eps1
    ans = Calculator.calc(0.001, 10)
    assert_in_delta(ans[0], TRUE_SUM, 1e-3)
  end

  def test_eps2
    ans = Calculator.calc(0.0001, 10)
    assert_in_delta(ans[0], TRUE_SUM, 1e-4)
  end
end
