class HumanPlayer
  attr_reader :name
  attr_accessor :mark

  def initialize(name, mark = :X)
    @name = name
  end

  def get_move
  	puts "where do you want to move? (row, column) -rows and columns go from 0-2"
  	move = gets.chomp
  	move.scan(/\d/).map(&:to_i)
  end

  def display(board)
    board.grid.each do |row|
      p row
    end
  end
end
