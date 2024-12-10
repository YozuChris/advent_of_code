# frozen_string_literal: true

module Year2023
  class Day02 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      max_red = 12
      max_green = 13
      max_blue = 14
      games_data = data.map do |game|
        result = {}
        result['id'] = game.split(':')[0].delete(' Game').to_i
        rounds = game.split(':')[1].split(';')
        result['rounds'] = {}
        rounds.each_with_index do |round, index|
          result['rounds'][index] = {}
          round.split(',').each do |cube_group|
            result['rounds'][index][cube_group.split(' ')[1]] = cube_group.split(' ')[0].to_i
          end
        end
        result
      end

      games_data.reduce(0) do |sum, game_data|
        possible = true
        game_data['rounds'].each do |_k, round|
          possible = false if round['red'] && round['red'] > max_red
          possible = false if round['green'] && round['green'] > max_green
          possible = false if round['blue'] && round['blue'] > max_blue
        end

        possible ? sum + game_data['id'] : sum
      end
    end

    def part_2
      games_data = data.map do |game|
        result = {}
        result['id'] = game.split(':')[0].delete(' Game').to_i
        rounds = game.split(':')[1].split(';')
        result['rounds'] = {}
        rounds.each_with_index do |round, index|
          result['rounds'][index] = {}
          round.split(',').each do |cube_group|
            result['rounds'][index][cube_group.split(' ')[1]] = cube_group.split(' ')[0].to_i
          end
        end
        result
      end

      min_cube_counts = games_data.map do |game_data|
        game_data['rounds'].each_with_object({}) do |round, result|
          result['red'] = round[1]['red'] if round[1]['red'] && round[1]['red'] > (result['red'] || 0)
          result['green'] = round[1]['green'] if round[1]['green'] && round[1]['green'] > (result['green'] || 0)
          result['blue'] = round[1]['blue'] if round[1]['blue'] && round[1]['blue'] > (result['blue'] || 0)
          result
        end
      end

      min_cube_counts.map do |cube_count|
        cube_count.reduce(1) do |power, cube|
          power * cube[1]
        end
      end.sum
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
