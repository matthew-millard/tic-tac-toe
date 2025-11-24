# frozen_string_literal: true

require_relative 'board'
require_relative 'player'

# Main game class that manages the Tic Tac Toe game logic
class Game
  attr_accessor :board, :player1, :player2, :turn_count, :winner

  WINNING_COMBOS = [
    # Horizontal wins
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    # Vertical wins
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    # Diagonal wins
    [0, 4, 8],
    [2, 4, 6]
  ].freeze

  def initialize
    @board = Board.new
    @player1 = Player.new('Player 1', 'X')
    @player2 = Player.new('Player 2', 'O')
    @turn_count = 0
    @winner = nil
  end

  def check_winner
    WINNING_COMBOS.each do |combo|
      pos1 = board.grid[combo[0]]
      pos2 = board.grid[combo[1]]
      pos3 = board.grid[combo[2]]

      return player1.marker == pos1 ? player1 : player2 if pos1 == pos2 && pos2 == pos3 && !pos1.strip.empty?
    end
    nil
  end

  def valid_input?(input)
    input.between?(0, 8) && board.grid[input].strip.empty?
  end

  def start
    puts 'New game started.'
    play
  end

  def current_player
    turn_count.even? ? player1 : player2
  end

  def players_input
    players_input = nil
    loop do
      players_input = gets.chomp.to_i
      break if valid_input?(players_input)

      puts 'Invalid input! Please enter a number between 0-8 for an empty space.'
    end
    players_input
  end

  def update_board(square)
    board.grid[square] = current_player.marker
  end

  def display_turn
    puts "#{current_player.name}, it's your turn."
  end

  def gameover
    if winner
      stop
    else
      tied
    end
  end

  def play
    until winner || turn_count >= 9
      board.display
      display_turn
      input = players_input
      update_board(input)
      self.winner = check_winner
      self.turn_count += 1
    end

    gameover
  end

  def stop
    board.display
    puts "Gameover. #{winner.name} is the winner!"
  end

  def tied
    board.display
    puts 'Game tied!'
  end
end
