class Game 

  attr_accessor :turn, :counter

  def initialize
    @turn = 0
    @counter = 0
  end
end 

game = Game.new

class GameBoard 
  
  def initialize
    @board = [
               ['','',''],
               ['','',''],
               ['','','']
    ]
  end

    def display_board
      @board.each do |row|
        row.each {|cell| print "[ #{cell} ]" }
        puts "\n--------------"
      end
  end
end

  board = GameBoard.new 
  board.display_board