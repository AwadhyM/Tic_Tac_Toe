# frozen_string_literal: true

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

class Game 
  attr_accessor :turn, :counter

  def initialize
    @turn = 0
    @counter = 0
    puts 'Welcome to this game of Tic Tac Toe.'
  end

  def ask_player
    @counter += 1
    puts "\nGreetings player#{@counter}, what username would you like for this game?"
  end

  def display_info(player1, player2)
    puts "Game Info:"
    puts "\n" + player1.name + " Move: #{player1.move}"
    puts "\n" + player2.name + " Move: #{player2.move}"
  end
end

game = Game.new 
board = GameBoard.new
board.display_board
game.ask_player
player1 = Players.new(gets.chomp.to_s, 'O')
game.ask_player
player2 = Players.new(gets.chomp.to_s, 'X')
game.display_info(player1, player2)

