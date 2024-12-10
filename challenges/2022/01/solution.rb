# frozen_string_literal: true

module Year2022
  class Day01 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      data.sort.last
    end

    def part_2
      data.sort.last(3).sum
    end

    private

    def first_digit(value)
      value.chars.find { |char| char =~ /\d/ }
    end

    # Processes each line of the input file and stores the result in the dataset
    # def process_input(line)
    #   line.map(&:to_i).slice_before(0).map(&:sum).sort
    # end

    # Processes the dataset as a whole
    def process_dataset(set)
      set.map(&:to_i).slice_before(0).map(&:sum).sort
    end
  end
end
