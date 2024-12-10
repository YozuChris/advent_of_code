# frozen_string_literal: true

module Year2023
  class Day04 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      scratch_card_data = data.each_with_object({}) do |game, result|
        index = game.split(':')[0].delete('Card ')
        game_card = game.split(':')[1]
        winners = game_card.split('|')[0]
        selected = game_card.split('|')[1]
        result[index.to_i] = {
          selected: selected.split(' ').map(&:to_i),
          winners: winners.split(' ').map(&:to_i)
        }
      end

      scratch_card_data.map do |game|
        matching = game[1][:winners] & game[1][:selected]
        matching.count > 0 ? 2**(matching.count - 1) : 0
      end.sum
    end

    def part_2
      scratch_card_data = data.each_with_object({}) do |game, result|
        index = game.split(':')[0].delete('Card ')
        game_card = game.split(':')[1]
        winners = game_card.split('|')[0]
        selected = game_card.split('|')[1]
        result[index.to_i] = {
          selected: selected.split(' ').map(&:to_i),
          winners: winners.split(' ').map(&:to_i),
          copies: 1
        }
      end

      (scratch_card_data.each do |game|
        matching = game[1][:winners] & game[1][:selected]
        (game[0] + 1..game[0] + matching.count).each do |x|
          scratch_card_data[x][:copies] += game[1][:copies]
        end
      end.sum { |game| game[1][:copies] })
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
