class TicTacToe
  attr_accessor :first_name, :second_name, :turn

  def initialize(first_name, second_name)
    @first_name = first_name
    @second_name = second_name
  end
end

class Board
  attr_accessor :board, :turn

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @turn = 1
  end

  def hit(coordinate)
    if board[coordinate] == coordinate + 1
      if turn == 1
        board[coordinate] = 'O'
        @turn = 2
      else
        board[coordinate] = 'X'
        @turn = 1
      end
      result
    else
      puts 'The space is occupied'
    end
  end

  # [1, 2, 3, 4, 5, 6, 7, 8, 9]
  def result
    if board[0] == 'X' && board[1] == 'X' && board[2] == 'X'
      puts 'second_name won!'
    else
      puts 'first_name won!'
    end
  end
end
p 'Welcome to Tic-Tic-Toe, what is your name?'
player1 = gets.chomp
player2 = gets.chomp
players = TicTacToe.new(player1, player2)
p players.first_name
p players.second_name
game_board = Board.new
while true
  puts("#{game_board.board[0]} | #{game_board.board[1]} | #{game_board.board[2]}
---+---+---
#{game_board.board[3]} | #{game_board.board[4]} | #{game_board.board[5]}
---+---+---
#{game_board.board[6]} | #{game_board.board[7]} | #{game_board.board[8]}")
  input = gets.chomp.to_i - 1
  game_board.hit(input)

end
