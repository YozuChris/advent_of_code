# frozen_string_literal: true

module Year2021
  class Day03 < Solution
    # @value is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line value file

    def part_1
      gamma = []
      epsilon = []
      data.first.length.times do |index|
        count_zero = 0
        count_one = 0

        data.each do |x|
          count_zero += 1 if x[index] == '0'
          count_one += 1 if x[index] == '1'
        end
        if count_zero > count_one
          gamma.push('0')
          epsilon.push('1')
        else
          gamma.push('1')
          epsilon.push('0')
        end
      end

      gamma.join.to_i(2) * epsilon.join.to_i(2)
    end

    def part_2
      oxygen_value(data) * co2_value(data)
    end

    private

    def oxygen_value(value, index = 0)
      return value.join.to_i(2) if value.length == 1

      count_zero, count_one = count_bits_at_index(value, index)

      if count_zero > count_one
        oxygen_value(remove_values_with_bit_at_index('1', index, value), index + 1)

      else
        oxygen_value(remove_values_with_bit_at_index('0', index, value), index + 1)
      end
    end

    def co2_value(value, index = 0)
      return value.join.to_i(2) if value.length == 1

      count_zero, count_one = count_bits_at_index(value, index)

      if count_zero > count_one
        co2_value(remove_values_with_bit_at_index('0', index, value), index + 1)

      else
        co2_value(remove_values_with_bit_at_index('1', index, value), index + 1)
      end
    end

    def count_bits_at_index(value, index)
      count_zero = 0
      count_one = 0

      value.each  do |x|
        count_zero += 1 if x[index] == '0'
        count_one += 1 if x[index] == '1'
      end

      [count_zero, count_one]
    end

    def remove_values_with_bit_at_index(bit, index, value)
      value.select { |x| x[index] != bit }
    end

    # Processes each line of the value file and stores the result in the dataset
    def process_input(line)
      line.chars
    end

    # Processes the dataset as a whole
    # def process_dataset(set)
    #   set
    # end
  end
end
