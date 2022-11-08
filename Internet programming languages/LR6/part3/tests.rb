# frozen_string_literal: true

require_relative 'main'
require 'minitest/autorun'

# Test class
class CaclTest < Minitest::Test
  TRUE_SUM1 = 7.5 + Math.sin(4) + Math.sin(1)
  TRUE_SUM2 = -0.376871

  def test_trap_lamda_func1
    ans = trap_lambda(->(x) { x + Math.cos(x) }, -1, 4, 100_000)
    assert_in_delta(ans, TRUE_SUM1, 1e-3)
  end

  def test_trap_yield_func1
    ans = trap_yield(-1, 4, 100_000) { |x| x + Math.cos(x) }
    assert_in_delta(ans, TRUE_SUM1, 1e-3)
  end

  def test_trap_lamda_func2
    ans = trap_lambda(->(x) { Math.tan(x + 1) / (x + 1) }, 1, 2, 1000)
    assert_in_delta(ans, TRUE_SUM2, 1e-3)
  end

  def test_trap_yield_func2
    ans = trap_yield(1, 2, 1000) { |x| Math.tan(x + 1) / (x + 1) }
    assert_in_delta(ans, TRUE_SUM2, 1e-3)
  end
end
