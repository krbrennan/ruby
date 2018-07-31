#needs words, an array of arrays, letters to populate arrays,
#instead of trying to format this in cli, maybe write the arrays to a blank word file...

class WordSearch
  attr_accessor :words, :board

  def initialize(words)
    @words = words
    @board = []
  end

  # board = Array.new(5){Array.new(5)}

  def populate_board
      letters = ('a'..'z').to_a
      25.times do |letter|
        @board << letters.sample
      end
      @board
  end

  def display_board
    p @board
  end


end

new_puzzle = WordSearch.new(['poop','farts','rectal'])
# new_puzzle.display_board
new_puzzle.populate_board

filled = new_puzzle.populate_board
file = File.new('layout','w')
file.puts filled
file.close
