# frozen_string_literal: true

require_relative 'main'
require 'minitest/autorun'
require_relative '../part1/main'

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

  def test_same_answers_eps1
    ans_classic = calc(0.001, 10)
    ans_hype = Calculator.calc(0.001, 10)
    assert_in_delta(ans_classic[0], ans_hype[0], 1e-3)
  end

  def test_same_answers_eps2
    ans_classic = calc(0.0001, 10)
    ans_hype = Calculator.calc(0.0001, 10)
    assert_in_delta(ans_classic[0], ans_hype[0], 1e-4)
  end
end
