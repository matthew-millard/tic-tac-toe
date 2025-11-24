# frozen_string_literal: true

# Represents the Tic Tac Toe game board
# The board is a 3x3 grid stored as a 9-element array (positions 0-8)
class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(9, ' ')
  end

  def display # rubocop:disable Metrics/AbcSize
    puts "#{grid[0]} | #{grid[1]} | #{grid[2]}"
    puts '---------'
    puts "#{grid[3]} | #{grid[4]} | #{grid[5]}"
    puts '---------'
    puts "#{grid[6]} | #{grid[7]} | #{grid[8]}"
  end
end
