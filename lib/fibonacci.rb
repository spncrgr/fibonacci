# frozen_string_literal: true

require 'bigdecimal'
require 'fibonacci/version'

class Fibonacci
  attr_reader :sequence

  COEFFICIENT = BigDecimal((1 / Math.sqrt(5)).to_s)

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
    raise ArgumentError, 'The generated sequence must have a length of at least one' if sequence_length <= 0

    @sequence = Array.new(sequence_length, 1)
    sequence_length.times do |i|
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
  # @example Negative sequence number values are not supported
  #   sequence.value_at(-1) #=> RangeError
  #
  # @param [Integer] sequence_number The 'nth' entry of a generated Fibonacci sequence.
  # @return [Integer] The value of the 'nth' entry of the generated Fibonacci sequence
  def value_at(sequence_number)
    if sequence_number.negative?
      raise RangeError,
            'The elements of a Fibonacci sequence can only be accessed using a positive sequence number.'
    end
    sequence[sequence_number - 1]
  end

  # @example Given a standard Fibonacci sequence, return the value of the sixth entry of the sequence.
  #   Fibonacci.value_at(6) #=> 13
  #
  # @example Generating negative Fibonacci numbers is not supported
  #   Fibonacci.value_at(-1) #=> RangeError
  #
  # @param [Integer] sequence_number The 'nth' entry of a standard Fibonacci sequence.
  # @return [Integer] The value of the 'nth' entry of a standard Fibonacci sequence
  def self.value_at(sequence_number)
    if sequence_number.negative?
      raise ArgumentError,
            'Generating a negative Fibonacci numbers is not supported'
    end
    n = BigDecimal(sequence_number.to_s)

    first_difference  = BigDecimal((((1 + Math.sqrt(5)) / 2)**n).to_s)
    second_difference = BigDecimal((((1 - Math.sqrt(5)) / 2)**n).to_s)
    (COEFFICIENT * first_difference) - (COEFFICIENT * second_difference)
  end
end
