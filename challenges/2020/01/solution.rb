# frozen_string_literal: true

module Year2020
  class Day01 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      data.combination(2).find { |expense| expense.sum == 2020 }.reduce(:*)
    end

    def part_2
      data.combination(3).find { |expense| expense.sum == 2020 }.reduce(:*)
    end

    private

    # Processes each line of the input file and stores the result in the dataset
    def process_input(line)
      line.to_i
    end

    # Processes the dataset as a whole
    # def process_dataset(set)
    #   set
    # end
  end
end
