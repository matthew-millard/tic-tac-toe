# frozen_string_literal: true

# Represents a player in the Tic Tac Toe game
# Each player has a name and a marker (X or O)
class Player
  attr_reader :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
  end
end
