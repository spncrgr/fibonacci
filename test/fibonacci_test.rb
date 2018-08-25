require 'test_helper'

class FibonacciTest < Minitest::Test

  def setup
    @example_sequence = Fibonacci.new(12)
  end

  def test_that_it_creates_a_sequence
    expected = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144]
    assert_equal(expected, @example_sequence.sequence)
  end

  def test_that_it_returns_index_6
    actual = @example_sequence.value_at(6)
    assert_equal(13, actual)
  end

  def test_that_it_raises_error
    assert_raises(RangeError) do
      @example_sequence.value_at(-1)
    end
  end
end
