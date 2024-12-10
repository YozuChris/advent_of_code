# frozen_string_literal: true

module Year2021
  class Day02 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      depth = 0
      horizontal = 0

      data.each do |key, value|
        case key
        when 'forward'
          horizontal += value
        when 'down'

          depth += value
        when 'up'
          depth -= value
        end
      end

      depth * horizontal
    end

    def part_2
      aim = 0
      depth = 0
      horizontal = 0

      data.each do |key, value|
        case key
        when 'forward'
          horizontal += value
          depth += aim * value
        when 'down'

          aim += value

        when 'up'
          aim -= value
        end
      end

      depth * horizontal
    end

    private

    # Processes each line of the input file and stores the result in the dataset
    def process_input(line)
      line.split.tap { |x| x[1] = x[1].to_i }
    end

    # Processes the dataset as a whole
    # def process_dataset(set)
    #   set
    # end
  end
end
