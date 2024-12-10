# frozen_string_literal: true

module Year2021
  class Day05 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      vent_map = VentMap.new
      data.each { |x| vent_map.map_vent(x[0], x[1]) }
      vent_map.number_of_multi_vents
    end

    def part_2
      vent_map = VentMap.new
      data.each { |x| vent_map.map_vent_diag(x[0], x[1]) }
      vent_map.number_of_multi_vents
    end

    private

    # Processes each line of the input file and stores the result in the dataset
    # def process_input(line)
    #   line.map(&:to_i)
    # end

    # Processes the dataset as a whole
    def process_dataset(set)
      set.map { |x| x.split(' -> ').map { |y| y.split(',').map(&:to_i) } }
    end
  end

  class VentMap
    def initialize
      @map = Hash.new(0)
    end

    def map_vent(coord_1, coord_2)
      x1, y1 = coord_1
      x2, y2 = coord_2

      dx = x2 <=> x1
      dy = y2 <=> y1

      if dx == 0
        y1.step(y2, dy).map { |y| [x1, y] }.each { |coord| @map[coord] += 1 }
      elsif dy == 0
        x1.step(x2, dx).map { |x| [x, y1] }.each { |coord| @map[coord] += 1 }
      end
    end

    def map_vent_diag(coord_1, coord_2)
      x1, y1 = coord_1
      x2, y2 = coord_2

      dx = x2 <=> x1
      dy = y2 <=> y1

      if dx == 0
        y1.step(y2, dy).map { |y| [x1, y] }.each { |coord| @map[coord] += 1 }
      elsif dy == 0
        x1.step(x2, dx).map { |x| [x, y1] }.each { |coord| @map[coord] += 1 }
      else
        x1.step(x2, dx).zip(y1.step(y2, dy)).each { |coord| @map[coord] += 1 }
      end
    end

    def number_of_multi_vents
      @map.values.count { |x| x >= 2 }
    end
  end
end
