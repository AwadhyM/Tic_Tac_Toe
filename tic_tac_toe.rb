# frozen_string_literal: true

require 'pry-byebug'

class GameBoard

  attr_reader :grid, :counter, :column, :diagonal

  def initialize
    @grid = [
      ['', '', ''],
      ['', '', ''],
      ['', '', '']
    ]
    @counter = 0

    @column = Array.new
    @diagonal = Array.new 
  end

  def display_board
    grid.each do |row|
      row.each { |cell| print "[ #{cell} ]" }
      puts "\n--------------"
    end
  end

  def verify_x_coordinate(game)
    while game.x < 1 || game.x > 3
      game.retrieve_x_coordinate
  end
end

  def verify_y_coordinate(game)
    while game.y < 1 || game.y > 3
      game.retrieve_y_coordinate
    end
  end

  def check_winner_row(player1, player2, counter, game)
    while @counter <= 2 do
    if grid[@counter].uniq == [''] || grid[@counter].uniq.length > 1
      @counter += 1
    elsif grid[@counter].length == 3 && grid[@counter].uniq == ['O']
      self.display_board
      puts "Congratulations #{player1.name} you win!"
      @counter += 1
      game.end_game
    elsif grid[@counter].length == 3 && grid[@counter].uniq == ['X']
      self.display_board
      puts "Congratulations #{player2.name} you win!"
      @counter += 1
      game.end_game
    end
  end
end

def check_winner_column(player1, player2, counter, game)
  while @counter <= 2 do
    column = [grid[0][@counter], grid[1][@counter], grid[2][@counter]]
    if column.uniq == [''] || column.uniq.length > 1
      @counter += 1
    elsif column.length == 3 && column.uniq == ['O']
      self.display_board
      puts "Congratulations #{player1.name} you win!"
      @counter += 1
      game.end_game
    elsif column.length == 3 && column.uniq == ['X']
      self.display_board
      puts "Congratulations #{player2.name} you win!"
      @counter += 1
      game.end_game
    end
  end
end

  def check_winner_diagonal_1(player1, player2, counter, game)
    diagonal = [grid[0][0], grid[1][1], grid[2][2]]
    if diagonal.uniq == [''] || diagonal.uniq.length > 1
      @counter += 1
    elsif diagonal.length == 3 && diagonal.uniq == ['O']
      self.display_board
      puts "Congratulations #{player1.name} you win!"
      game.end_game
    elsif diagonal.length == 3 && diagonal.uniq == ['X']
      self.display_board
      puts "Congratulations #{player2.name} you win!"
      game.end_game
    end
  end

  def check_winner_diagonal_2(player1, player2, counter, game)
    while @counter <= 2 do
    diagonal = [grid[0][2], grid[1][1], grid[2][0]]
    if diagonal.uniq == [''] || diagonal.uniq.length > 1
      @counter += 1
    elsif diagonal.length == 3 && diagonal.uniq == ['O']
      self.display_board
      puts "Congratulations #{player1.name} you win!"
      game.end_game
    elsif diagonal.length == 3 && diagonal.uniq == ['X']
      self.display_board
      puts "Congratulations #{player2.name} you win!"
      game.end_game
    end
  end 
end 

  def reset_counter
    @counter = 0
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
  attr_reader :turn, :number_of_player, :x, :y

  def initialize
    @turn = 0
    @number_of_player = 0
    @x = 0
    @y = 0
    puts 'Welcome to this game of Tic Tac Toe.'
  end

  def ask_player
    @number_of_player += 1
    puts "\nGreetings player#{@number_of_player}, what username would you like for this game?"
  end

  def retrieve_x_coordinate
    puts "Enter a number between 1 - 3 for the x coordinate in which you would like to place your move"
    @x = gets.chomp.to_i
  end

  def retrieve_y_coordinate
    puts "Enter a number between 1 - 3 for the y coordinate in which you would like to place your move"
    @y = gets.chomp.to_i
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
    board.verify_x_coordinate(game)
    game.retrieve_y_coordinate
    board.verify_y_coordinate(game)
    game.append_move(x, y, board)
    board.check_winner_row(player1, player2, @counter, game)
    board.reset_counter
    board.check_winner_column(player1, player2, @counter, game)
    board.reset_counter
    board.check_winner_diagonal_1(player1,player2, @counter, game)
    board.check_winner_diagonal_2(player1,player2, @counter, game)
    board.reset_counter
    @turn += 1
  end
end

def append_move(x, y, board)
  
  if @turn % 2 == 0
    board.grid[y - 1][x - 1] = 'O'
  else
    board.grid[y - 1][x - 1] = 'X'
  end
end

def end_game
  @turn = 8
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