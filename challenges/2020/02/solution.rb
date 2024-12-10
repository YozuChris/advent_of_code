# frozen_string_literal: true

module Year2020
  class Day02 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      data.map { |i| i.split }.count do |i|
        bounds = i[0].split('-').map(&:to_i)
        (bounds[0]..bounds[1]).include?(i[2].count(i[1][0]))
      end
    end

    def part_2
      data.map { |i| i.split }.count do |i|
        places = i[0].split('-').map(&:to_i)
        (i[2][places[0] - 1] == i[1][0]) ^ (i[2][places[1] - 1] == i[1][0])
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
