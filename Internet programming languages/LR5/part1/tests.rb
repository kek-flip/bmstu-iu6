# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'main'

# test class
class FuncTest < MiniTest::Test
  def test_thirty_one
    res = func(31)
    assert_equal(res, 9.593839453594978e-10)
  end

  def test_one
    res = func(1)
    assert_equal(res, -0.38542559176909813)
  end

  def test_zero
    res = func(0)
    assert_equal(res, 0)
  end
end
