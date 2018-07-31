# I/O Exercises
#
# * Write a `guessing_game` method. The computer should choose a number between
#   1 and 100. Prompt the user to `guess a number`. Each time through a play loop,
#   get a guess from the user. Print the number guessed and whether it was `too
#   high` or `too low`. Track the number of guesses the player takes. When the
#   player guesses the number, print out what the number was and how many guesses
#   the player needed.
# * Write a program that prompts the user for a file name, reads that file,
#   shuffles the lines, and saves it to the file "{input_name}-shuffled.txt". You
#   could create a random number using the Random class, or you could use the
#   `shuffle` method in array.


def guessing_game
  answer = rand(1..100)
  num_guesses = 0

  loop do
    puts "========================="
    puts "guess a number from 1-100"
    puts "========================="
    choice = gets.chomp.to_i
    num_guesses += 1
    if choice == answer
      puts "Yesss, the secret number was #{answer}"
      puts "It took you #{num_guesses} tries to get it right"
      puts "========================="
      break
    end
    if choice > answer
      puts "~~~~~~~~~~~~~~~~~~~~"
      puts "#{choice} is too high"
      puts "~~~~~~~~~~~~~~~~~~~~"
    else
      puts "~~~~~~~~~~~~~~~~~~~~"
      puts "#{choice} is too low"
      puts "~~~~~~~~~~~~~~~~~~~~"
    end
  end
end



# Write a program that prompts the user for a file name, reads that file,
#   shuffles the lines, and saves it to the file "{input_name}-shuffled.txt". You
#   could create a random number using the Random class, or you could use the
#   `shuffle` method in array.

#!/usr/bin/env ruby

  def shuffler
    puts "I want to shuffle the lines of a file you have"
    puts "please provide a file name with \'.txt\' on the end"
    file_name = gets.chomp

    File.open("#{file_name}-shuffled.txt", 'w'){|old_doc| old_doc.puts File.readlines(file_name).shuffle}
    puts "ok, all the shit in the file you provided will now be shuffled and put in a new file"
  end
  
  # shuffler
