# frozen_string_literal: true

require 'test_helper'
require 'minitest/benchmark'

class FibonacciBenchTest < Minitest::Benchmark
  # Test the performance of the "straightforward" solution of generating a Fibonacci sequence to `n` and then returning
  # the value at index `n`
  def bench_solution_one
    assert_performance_constant(0.9999) do |n|
      sequence = Fibonacci.new(n)
      sequence.value_at(n)
    end
  end

  # Test the performance of the revised solution
  def bench_solution_two
    assert_performance_linear do |n|
      Fibonacci.value_at(n)
    end
  end
end
