# frozen_string_literal: true

module Year2023
  class Day01 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      data.map do |calibration|
        Integer("#{first_digit(calibration)}#{first_digit(calibration.reverse)}")
      end.sum
    end

    def part_2
      numbers = { 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4', 'five' => '5', 'six' => '6',
                  'seven' => '7', 'eight' => '8', 'nine' => '9' }
      reverse_numbers = numbers.map { |k, v| [k.reverse, v] }.to_h

      data.map do |calibration|
        cleaned_first_calibration = replace_first_instance(numbers, calibration)
        cleaned_last_calibration = replace_first_instance(reverse_numbers, calibration.reverse).reverse
        Integer("#{first_digit(cleaned_first_calibration)}#{first_digit(cleaned_last_calibration.reverse)}")
      end.sum
    end

    private

    def first_digit(value)
      value.chars.find { |char| char =~ /\d/ }
    end

    def replace_first_instance(word_map, input)
      indexes = word_map.map do |word, number|
        index = input.index(word)
        [number, word, index] if index
      end.compact

      if indexes.any?
        lowest_index = indexes.min_by { |a| a[2] }
        input.sub(lowest_index[1], lowest_index[0].to_s)
      else
        input
      end
    end

    # Processes each line of the input file and stores the result in the dataset
    # def process_input(line)
    #   line.map(&:to_i)
    # end

    # Processes the dataset as a whole
    # def process_dataset(set)
    #   set
    # end
  end
end
