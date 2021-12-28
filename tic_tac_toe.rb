# frozen_string_literal: true

require 'pry-byebug'

class GameBoard

  attr_reader :grid

  def initialize
    @grid = [
      ['', '', ''],
      ['', '', ''],
      ['', '', '']
    ]
  end

  def display_board
    grid.each do |row|
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

  def verify_name
    while name.empty? == true
      puts 'State your name. NO empty spaces this time'
      @name = gets.chomp
    end
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

  def retrieve_x_coordinate
    puts "enter the x coordinate in which you would like to place your move"
  end

  def retrieve_y_coordinate
    puts "enter the y coordinate in which you would like to place your move"
  end

  def display_info(player1, player2)
    puts 'Game Info:'
    puts "\nUsername:#{player1.name} |Move: #{player1.move}"
    puts "\nUsername:#{player2.name} |Move: #{player2.move}"
  end

  def play_round (board, game, player1, player2)
    while @turn <= 7 do
    board.display_board
    game.retrieve_x_coordinate
    x = gets.chomp.to_i
    game.retrieve_y_coordinate
    y = gets.chomp.to_i
    game.append_move(x, y, board)
    @turn += 1
  end
end

def append_move(x, y, board)
  if @turn % 2 == 0
    board.grid[x-1][y-1] = 'O'
  else 
    board.grid[x - 1][y - 1] = 'X'
  end
end

end



game = Game.new
board = GameBoard.new
game.ask_player
player1 = Players.new(gets.chomp.to_s, 'O')
player1.verify_name
game.ask_player
player2 = Players.new(gets.chomp.to_s, 'X')
player2.verify_name
game.display_info(player1, player2)
game.play_round(board, game, player1, player2)