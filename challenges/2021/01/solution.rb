# frozen_string_literal: true

module Year2021
  class Day01 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      data.each_cons(2)
          .count { |x| x[0] < x[1] }
    end

    def part_2
      data.each_cons(3)
          .map { |x| x.sum }
          .each_cons(2)
          .count { |x| x[0] < x[1] }
    end

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
