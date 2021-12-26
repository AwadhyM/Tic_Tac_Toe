# frozen_string_literal: true

class Game
  attr_accessor :turn, :counter

  def initialize
    @turn = 0
    @counter = 0
  end

  def fetch_player
    puts "\nGreetings player#{@@number_of_players}, what username would you like for this game?"
  end
end

class GameBoard
  def initialize
    @board = [
      ['', '', ''],
      ['', '', ''],
      ['', '', '']
    ]
  end

  def display_board
    @board.each do |row|
      row.each { |cell| print "[ #{cell} ]" }
      puts "\n--------------"
    end
  end
end

class Players
  attr_accessor :name, :move

  @@number_of_players = 0

  def initialize(name, move)
    @name = name
    @move = move
    @@number_of_players += 1
  end
end

game = Game.new 
