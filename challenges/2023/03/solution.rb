# frozen_string_literal: true

module Year2023
  class Day03 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      engine_layout = data.map(&:strip).map do |line|
        line.chomp.chars
      end

      number_locations = {}
      number_indexes = Marshal.load(Marshal.dump(engine_layout))
      number_index = 0

      scanned = []

      number_indexes.each_with_index do |row, y|
        row.each_with_index do |character, x|
          next if scanned.include?("#{x} #{y}")

          next unless character.is_a?(String) && /\d/.match?(character)

          number = [character]
          number_indexes[y][x] = number_index
          scanned << "#{x}#{y}"

          offset = 1
          while /\d/.match?(row[x + offset])
            number << row[x + offset]
            number_indexes[y][x + offset] = number_index
            scanned << "#{x + offset} #{y}"
            offset += 1
          end
          number_locations = number_locations.merge({ number_index => number.join.to_i })

          number_index += 1
        end
      end

      missing_parts = []

      engine_layout.each_with_index do |row, y|
        row.each_with_index do |character, x|
          next unless !/\d/.match?(character) && !/\./.match?(character)

          (-1..1).each do |y_offset|
            (-1..1).each do |x_offset|
              if x + x_offset < 0 || y + y_offset < 0 || x + x_offset >= row.length || y + y_offset >= engine_layout.length
                next
              end

              unless /\d/.match?(engine_layout[y + y_offset][x + x_offset]) && number_locations.include?(number_indexes[y + y_offset][x + x_offset])
                next
              end

              missing_parts << number_locations[number_indexes[y + y_offset][x + x_offset]]
              number_locations.delete(number_indexes[y + y_offset][x + x_offset])
            end
          end
        end
      end

      missing_parts.sum
    end

    def part_2
      engine_layout = data.map(&:strip).map do |line|
        line.chomp.chars
      end

      number_locations = {}
      number_indexes = Marshal.load(Marshal.dump(engine_layout))
      number_index = 0

      scanned = []

      number_indexes.each_with_index do |row, y|
        row.each_with_index do |character, x|
          next if scanned.include?("#{x} #{y}")

          next unless character.is_a?(String) && /\d/.match?(character)

          number = [character]
          number_indexes[y][x] = number_index
          scanned << "#{x}#{y}"

          offset = 1
          while /\d/.match?(row[x + offset])
            number << row[x + offset]
            number_indexes[y][x + offset] = number_index
            scanned << "#{x + offset} #{y}"
            offset += 1
          end
          number_locations = number_locations.merge({ number_index => number.join.to_i })

          number_index += 1
        end
      end

      gear_ratios = []

      number_indexes.each_with_index do |row, y|
        row.each_with_index do |element, x|
          next unless element == '*'

          gears = []

          (-1..1).each do |y_offset|
            (-1..1).each do |x_offset|
              if x + x_offset < 0 || y + y_offset < 0 || x + x_offset >= row.length || y + y_offset >= engine_layout.length
                next
              end

              if /\d/.match?(engine_layout[y + y_offset][x + x_offset]) && number_locations.include?(number_indexes[y + y_offset][x + x_offset])
                gears << number_locations[number_indexes[y + y_offset][x + x_offset]]
                number_locations.delete(number_indexes[y + y_offset][x + x_offset])
              end
            end
          end
          gear_ratios << gears.reduce(:*) if gears.length == 2
        end
      end

      gear_ratios.sum
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
