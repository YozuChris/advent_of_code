require 'debug'

module Year2024
  class Day01 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      left_places = data.map { |x| x[0] }.sort
      right_places = data.map { |x| x[1] }.sort
      left_places.zip(right_places).sum { |x| (x[0] - x[1]).abs }
    end

    def part_2
      left_places = data.map { |x| x[0] }
      right_places = data.map { |x| x[1] }
      left_places.sum { |x| x * right_places.count(x) }
    end

    # Processes each line of the input file and stores the result in the dataset
    def process_input(line)
      line.split('   ').map(&:to_i)
    end
  end
end
