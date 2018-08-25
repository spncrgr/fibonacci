require "test_helper"

class FibonacciTest < Minitest::Test
  def test_that_it_returns_13
    actual = Fibonacci.value_at(6)
    assert_equal(13, actual)
  end
end
