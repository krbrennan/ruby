require 'byebug'

# EASY

# Define a method that returns the sum of all the elements in its argument (an
# array of numbers).
def array_sum(arr)
  return 0 if arr.empty?
  arr.reduce(&:+)
end

# Define a method that returns a boolean indicating whether substring is a
# substring of each string in the long_strings array.
# Hint: you may want a sub_tring? helper method
def in_all_strings?(long_strings, substring)
  long_strings.all?{|string| string.include?(substring)}
end

# Define a method that accepts a string of lower case words (no punctuation) and
# returns an array of letters that occur more than once, sorted alphabetically.
def non_unique_letters(string)
  string.chars.select{|letter| string.count(letter) > 1 unless letter == " " }.uniq.sort
end

# Define a method that returns an array of the longest two words (in order) in
# the method's argument. Ignore punctuation!
def longest_two_words(string)
  string.split.max_by(2){|word| word.length}
end

# MEDIUM

# Define a method that takes a string of lower-case letters and returns an array
# of all the letters that do not occur in the method's argument.
def missing_letters(string)
  letters = *('a'..'z')
  letters.reject{|letter| string.include?(letter)}
end

# Define a method that accepts two years and returns an array of the years
# within that range (inclusive) that have no repeated digits. Hint: helper
# method?
def no_repeat_years(first_yr, last_yr)
  years = *(first_yr..last_yr)
  years.reject{|year| not_repeat_year?(year)}
end

def not_repeat_year?(year)
  year.to_s.chars.any?{|number| year.to_s.chars.count(number) > 1}
end

# HARD

# Define a method that, given an array of songs at the top of the charts,
# returns the songs that only stayed on the chart for a week at a time. Each
# element corresponds to a song at the top of the charts for one particular
# week. Songs CAN reappear on the chart, but if they don't appear in consecutive
# weeks, they're "one-week wonders." Suggested strategy: find the songs that
# appear multiple times in a row and remove them. You may wish to write a helper
# method no_repeats?
def one_week_wonders(songs)
  (songs - songs.each_cons(2).select{|el1,el2| el1 == el2}.flatten).uniq
end

def no_repeats?(song_name, songs)
end

# Define a method that, given a string of words, returns the word that has the
# letter "c" closest to the end of it. If there's a tie, return the earlier
# word. Ignore punctuation. If there's no "c", return an empty string. You may
# wish to write the helper methods c_distance and remove_punctuation.


def for_cs_sake(string)
string.delete!('?!.,')
reversed = string.split.map(&:reverse)
relevant_words = reversed.select{|word| word.include?('c')}

winner = relevant_words.first

relevant_words.each do |word|
  word.delete('?.,!').chars.each_with_index do |letter, idx|
    if letter == 'c' && idx < winner.index('c')
        winner = word
    end
  end
end
winner.reverse
end


# def c_distance(word)
# end

# Define a method that, given an array of numbers, returns a nested array of
# two-element arrays that each contain the start and end indices of whenever a
# number appears multiple times in a row. repeated_number_ranges([1, 1, 2]) =>
# [[0, 1]] repeated_number_ranges([1, 2, 3, 3, 4, 4, 4]) => [[2, 3], [4, 6]]

def repeated_number_ranges(arr)
  solution = []
  start_idx = nil

  arr.each_with_index do |num, idx|
    next_num = arr[idx + 1]
    if num == next_num
      start_idx = idx unless start_idx
    elsif start_idx
      solution << [start_idx, idx]
      start_idx = nil
    end
  end
  solution
end
