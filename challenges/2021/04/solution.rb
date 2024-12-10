# frozen_string_literal: true

require 'matrix'

module Year2021
  class Day04 < Solution
    # @input is available if you need the raw data input
    # Call `data` to access either an array of the parsed data, or a single record for a 1-line input file

    def part_1
      data.first_winning_board
    end

    def part_2
      data.last_winning_board
    end

    # Processes each line of the input file and stores the result in the dataset
    # def process_input(line)
    #   line.map(&:to_i)
    # end

    # Processes the dataset as a whole
    def process_dataset(set)
      Bingo.new(set)
    end
  end

  class Board
    # require 'matrix'

    def initialize(values)
      @values = values
      @dabs = Array.new(5).map { Array.new(5) }
      @last_ball = nil
    end

    def dab(ball)
      location = Matrix[*@values].index(ball)
      return unless location

      @dabs[location[0]][location[1]] = true
      @last_ball = ball
    end

    def bingo?
      @dabs.detect { |row| row.all?(true) } || @dabs.transpose.detect { |column| column.all?(true) }
    end

    def score
      @values
        .flatten
        .each_with_index
        .select { |_value, index| !@dabs.flatten[index] }
        .map { |x| x[0] }
        .sum * @last_ball
    end
  end

  class Bingo
    def initialize(input)
      @bingo_balls = input.first.split(',').map(&:to_i)
      @boards = input[1..-1].select do |x|
        x.length > 0
      end.map { |x| x.split.map(&:to_i) }.each_slice(5).map { |x| Board.new(x) }
    end

    def first_winning_board
      winner = nil
      @bingo_balls.each do |ball|
        @boards.each { |board| board.dab(ball) }
        winner = @boards.detect { |board| board.bingo? }
        break if winner
      end

      winner.score
    end

    def last_winning_board
      candidates = @boards.dup
      @bingo_balls.each do |ball|
        candidates.each { |board| board.dab(ball) }
        if candidates.length != 1

          candidates.reject! { |board| board.bingo? }
        elsif candidates.first.bingo?
          break
        end
      end
      candidates.first.score
    end
  end
end
