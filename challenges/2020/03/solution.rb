# frozen_string_literal: true

module Year2020
  class Day03 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      count = 0
      x = 0
      data.each do |line|
        x -= line.length if x >= line.length
        count += 1 if line[x] == '#'
        x += 3
      end

      count
    end

    def part_2
      nil
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
