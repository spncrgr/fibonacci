# require 'fibonacci/version'

class Fibonacci

  attr_reader :sequence

  def initialize(sequence_length)
    length = sequence_length - 1
    @sequence = Array.new(length, 1)
    2.step(length) do |i|
      sequence[i] = sequence[i - 1] + sequence[i - 2]
    end
  end

  # @example Given a standard Fibonacci sequence, return the value of the sixth entry of the sequence.
  #   Fibonacci.value_at(6) #=> 13
  #
  # @example Negative index values are not supported
  #   Fibonacci.value_at(-1) #=> RangeError
  #
  # @param [Integer] index A zero-based index which applies to a standard Fibonacci sequence. The value at that
  # location in the sequence is what is returned.
  # @return [Integer] A value from a standard Fibonacci sequence
  def value_at(index)
    if index < 0
      raise RangeError,
            "The elements of a Fibonacci sequence can only be accessed using a positive index (greater than or equal to zero)."
    end
    sequence[index]
  end
end
