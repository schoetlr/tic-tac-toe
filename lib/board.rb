class Board
  attr_reader :grid

  def initialize( grid = Array.new(3){ Array.new(3) {nil} } )
    @grid = grid
  end

  def place_mark(pos, mark)
  	row, col = pos
    grid[row][col] = mark
  end

  def over?
  	if winner != nil || grid.all? {|row| row.include?(nil) == false}
  	  return true
  	else 
  	  return false
  	end
  end

  def empty?(pos)
  	row, col = pos
  	if grid[row][col] == nil
  	  return true
  	else
  	  return false
  	end
  end

  def winner
  	(grid + cols + diagnols).each do |triple|
  	  if triple == [:X, :X, :X]
  	    return :X
  	  elsif triple == [:O, :O, :O]
  	    return :O
  	  end
  	end
  	nil
  end

  def cols
  	grid.transpose
  end

  def diagnols
    left_to_right = [grid[0][0], grid[1][1], grid[2][2]]
    right_to_left = [grid[0][2], grid[1][1], grid[2][0]]
    [left_to_right, right_to_left]
  end

end
