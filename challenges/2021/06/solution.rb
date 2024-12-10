# frozen_string_literal: true

module Year2021
  class Day06 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      school = data.map { |x| Fish.new(x) }
      80.times do |_day|
        new_fish = school.map { |fish| fish.age_day }.compact
        school += new_fish
      end

      school.count
    end

    def part_2
      school = data.tally
      school.default = 0
      256.times do
        school.transform_keys! { |x| x - 1 }
        school[8] = school[-1]
        school[6] += school[-1]
        school[-1] = nil
      end

      puts school.values.compact.sum
    end

    # Processes each line of the input file and stores the result in the dataset
    def process_input(line)
      line.split(',').map(&:to_i)
    end

    # Processes the dataset as a whole
    # def process_dataset(set); end
  end

  class Fish
    def initialize(internal_timer = 8)
      @internal_timer = internal_timer
    end

    def age_day
      if @internal_timer == 0
        @internal_timer = 6
        Fish.new
      else
        @internal_timer -= 1
        nil
      end
    end

    def to_s
      @internal_timer.to_s
    end
  end
end
