

class Human
  attr_accessor :name, :board
  attr_reader :token

  def initialize(name)
    @name = name
  end

  def get_move
    puts "please select a move in the format 'x,y'"
    move = gets.chomp
    move.split(",").map(&:to_i)
  end

  def display
    puts board
  end

end

human = Human.new
#
# puts "What would you like your name to be?"
# name = gets.chomp
# player1 = Human.new(name)
