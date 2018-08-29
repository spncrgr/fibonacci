require 'test_helper'
require 'minitest/benchmark'

class FibonacciBenchTest < Minitest::Benchmark

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    # Do nothing
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.
  def teardown
    # Do nothing
  end

  # Test the performance of the "straightforward" solution of generating a Fibonacci sequence to `n` and then returning
  # the value at index `n`
  def bench_sequence_constant
    assert_performance_constant(0.9999) do |n|
      sequence = Fibonacci.new(n)
      sequence.value_at(n)
    end
  end
end