require_relative 'board'

class Game
  attr_accessor :name, :board, :current_player, :player_one, :player_two

  def initialize(player_one, player_two)
    @board = Board.new
    player_one_mark = :X
    player_two_mark = :O
    @current_player = player_one
    @player_one = player_one
    @player_two = player_two
  end

  def switch_players!
    if @current_player == @player_one
      @current_player = @player_two
    else @current_player = @player_one
    end
  end


  def play
    board.display
    current_player.get_move
  end




end

game = Game.new(human, bob)
game.play
