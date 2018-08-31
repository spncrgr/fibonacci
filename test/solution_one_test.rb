# frozen_string_literal: true

require_relative 'test_helper'

class SolutionOneTest < Minitest::Test
  def setup
    @example_sequence = Fibonacci.new(12)
  end

  def test_that_it_creates_a_sequence
    expected = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144]
    assert_equal(expected, @example_sequence.sequence)
  end

  def test_that_it_creates_one_number
    @example_sequence = Fibonacci.new(1)
    expected = [1]
    assert_equal(expected, @example_sequence.sequence)
  end

  def test_that_it_creates_two_numbers
    @example_sequence = Fibonacci.new(2)
    expected = [1, 1]
    assert_equal(expected, @example_sequence.sequence)
  end

  def test_that_it_returns_entry_6
    actual = @example_sequence.value_at(6)
    assert_equal(8, actual)
  end

  def test_that_it_raises_range_error
    assert_raises(RangeError) do
      @example_sequence.value_at(-1)
    end
  end

  def test_that_it_raises_argument_error
    assert_raises(ArgumentError) do
      Fibonacci.new(0)
    end
  end
end
