# frozen_string_literal: true

require_relative 'lib/players'
require_relative 'lib/board'

def play_again?
  loop do
    p 'Do you want to play again? [y/n]:'
    input = gets.chomp.downcase
    if input.include?(%w[y yes])
      return true
    elsif input.include?(%w[n no])
      return false
    else
      puts "Invalid input. Please enter 'y'/'yes' or 'n'/'no'."
    end
  end
end

p "Welcome to Tic-Tic-Toe, what is the first player's name?"
player1 = gets.chomp
p "What is the second player's name?"
player2 = gets.chomp
players = Players.new(player1, player2)
game_board = Board.new
finish = false
while finish != true
  puts("#{game_board.board[0]} | #{game_board.board[1]} | #{game_board.board[2]}
---+---+---
#{game_board.board[3]} | #{game_board.board[4]} | #{game_board.board[5]}
---+---+---
#{game_board.board[6]} | #{game_board.board[7]} | #{game_board.board[8]}")
  if game_board.turn == 1
    p "It's #{players.first_name}'s turn."
  else
    p "It's #{players.second_name}'s turn."
  end
  input = gets.chomp.to_i - 1
  game_board.hit(input)
  next unless game_board.won == true

  if game_board.turn == 2
    p "#{players.first_name} won!"
  else
    p "#{players.second_name} won!"
  end
  if play_again?
    game_board = Board.new
  else
    finish = true
    puts 'Game over'
  end
end
