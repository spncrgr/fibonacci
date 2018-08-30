# frozen_string_literal: true

require 'test_helper'

class SolutionTwoTest < Minitest::Test
  def test_that_it_returns_entry_6
    actual = Fibonacci.value_at(6)
    assert_equal(8, actual)
  end

  def test_that_it_raises_an_argument_error
    assert_raises(ArgumentError) do
      Fibonacci.value_at(-1)
    end
  end
end
