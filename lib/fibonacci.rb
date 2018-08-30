# frozen_string_literal: true

require 'fibonacci/version'

class Fibonacci
  attr_reader :sequence

  # Create an instance of the Fibonacci class and generate a sequence. The sequence will be available
  # via Fibonacci.sequence
  #
  # @example Create a sequence of 12 Fibonacci numbers
  #   my_fibonacci = Fibonacci.new(12)
  #   sequence = my_fibonacci.sequence #=> [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144]
  #
  # @param [Integer] sequence_length The number of Fibonacci numbers to generate
  # @return [Array<Intger>] A sequence of Fibonacci numbers, starting at 1 and continuing
  # to a length of 'sequence_length'
  def initialize(sequence_length)
    if sequence_length <= 0
      raise ArgumentError, 'The generated sequence must have a length of at least one'
    end

    length    = sequence_length
    # length    = sequence_length - 1
    @sequence = Array.new(length, 1)
    length.times do |i|
      # Manually set the value of the first two elements of the generated sequence to the number 1
      if i <= 1
        @sequence[i] = 1
        next
      end

      @sequence[i] = @sequence[i - 1] + @sequence[i - 2]
    end
  end

  # @example Given a standard Fibonacci sequence, return the value of the sixth entry of the sequence.
  #   sequence.value_at(6) #=> 13
  #
  # @example Negative index values are not supported
  #   sequence.value_at(-1) #=> RangeError
  #
  # @param [Integer] index A zero-based index which applies to a standard Fibonacci sequence. The value at that
  # location in the sequence is what is returned.
  # @return [Integer] A value from a standard Fibonacci sequence
  def value_at(index)
    if index.negative?
      raise RangeError,
            'The elements of a Fibonacci sequence can only be accessed using a positive index.'
    end
    sequence[index]
  end

  # @example Given a standard Fibonacci sequence, return the value of the sixth entry of the sequence.
  #   Fibonacci.value_from_index(6) #=> 13
  #
  # @example Generating negative Fibonacci numbers is not supported
  #   sequence.value_from_index(-1) #=> RangeError
  #
  # @param [Integer] index A zero-based index which applies to a standard Fibonacci sequence. The value at that
  # location is calculated and returned.
  # @return [Integer] A value from a standard Fibonacci sequence
  def self.value_from_index(index)
    if index.negative?
      raise ArgumentError,
            'Generating a negative Fibonacci numbers is not supported'
    end
    n = index + 1

    coefficient       = 1 / Math.sqrt(5)
    first_difference  = ((1 + Math.sqrt(5)) / 2) ** n
    second_difference = ((1 - Math.sqrt(5)) / 2) ** n
    result            = (coefficient * first_difference) - (coefficient * second_difference)
    result.round
  end
end
