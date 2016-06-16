require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
  attr_accessor :player_one, :player_two, :board, :current_player

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @player_one.mark = :X
    @player_two.mark = :O
    @board = Board.new
    @current_player = player_one
  end

  def play
    until board.over?
      play_turn
    end
    
    current_player.display(board)
    switch_players!
    current_player.display(board)

    if player_one.mark == board.winner
      puts "#{player_one.name} won the game!"
    elsif player_two.mark == board.winner
      puts "#{player_two.name} won the game!"
    else 
      puts "Cat's Game!"
    end
  end

  def play_turn
    current_player.display(board)
    move = current_player.get_move
    mark = current_player.mark
    board.place_mark(move, mark)
    switch_players!
  end

  def switch_players!
  	if current_player == player_one
  	  self.current_player = player_two
  	else
  	  self.current_player = player_one
  	end
  end

end


if __FILE__ == $PROGRAM_NAME
  human = HumanPlayer.new("Tom")
  computer = ComputerPlayer.new("Jerry")
  game = Game.new(human, computer)
  game.play
end
