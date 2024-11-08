# frozen_string_literal: true

require_relative 'players'

# Board: initialize, hit, checkwin, won
class Board
  attr_accessor :board, :turn

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @turn = 1
  end

  def hit(coordinate)
    puts 'The space is occupied' if board[coordinate] != Number
    board[coordinate] = board[coordinate] == coordinate + 1 ? 'X' : 'O'
    @turn = @turn == 1 ? 2 : 1
  end

  def check_win(char)
    win_patterns = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    if win_patterns.any? { |pattern| pattern.all? { |index| board[index] == char } }
      true
    elsif board.all?(String)
      p "It's a tie!"
      true
    else
      false
    end
  end

  def won
    if turn == 2
      check_win('X')
    else
      check_win('O')
    end
  end
end
