require 'fibonacci/version'

class Fibonacci

  SEQUENCE = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144]

  # @example Given a standard Fibonacci sequence, return the value of the sixth entry of the sequence.
  #   Fibonacci.value_at(6) #=> 13
  #
  # @example Negative index values are not supported
  #   Fibonacci.value_at(-1) #=> RangeError
  #
  # @param [Integer] index A zero-based index which applies to a standard Fibonacci sequence. The value at that
  # location in the sequence is what is returned.
  # @return [Integer] A value from a standard Fibonacci sequence
  def self.value_at(index)
    if index < 0
      raise RangeError,
            "The elements of a Fibonacci sequence can only be accessed using a positive index (greater than or equal to zero)."
    end
    SEQUENCE[index]
  end
end
