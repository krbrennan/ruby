# EASY

# Return the argument with all its lowercase characters removed.
def destructive_uppercase(str)
  str.chars.reject{|letter| letter if letter == letter.downcase}.join
end

# Return the middle character of a string. Return the middle two characters if
# the word is of even length, e.g. middle_substring("middle") => "dd",
# middle_substring("mid") => "i"
def middle_substring(str)
  middle = str.length / 2

  if str.length.odd?
    return str[middle]
  else
    return str[(middle-1)..middle]
  end
end

# Return the number of vowels in a string.
VOWELS = %w(a e i o u)
def num_vowels(str)
  tot = 0
  str.chars.each{|letter| tot += 1 if VOWELS.include?(letter)}
  tot
end

# Return the factoral of the argument (num). A number's factorial is the product
# of all whole numbers between 1 and the number itself. Assume the argument will
# be > 0.
def factorial(num)
  (1..(num - 1)).each do |ele|
    num *= ele
  end
  num
end


# MEDIUM

# Write your own version of the join method. separator = "" ensures that the
# default seperator is an empty string.
def my_join(arr, separator = "")
  sol = ''
   arr.each_with_index do |ele, idx|
     if ele == arr.last
       sol << ele
     else
       sol << ele + separator
     end
   end
   sol
end

# Write a method that converts its argument to weirdcase, where every odd
# character is lowercase and every even is uppercase, e.g.
# weirdcase("weirdcase") => "wEiRdCaSe"
def weirdcase(str)
  result = ''
  str.chars.each_with_index do |ele, idx|
    if idx.odd?
      result << ele.upcase
    elsif idx.even?
      result << ele.downcase
    end
  end
  result
end

# Reverse all words of five more more letters in a string. Return the resulting
# string, e.g., reverse_five("Looks like my luck has reversed") => "skooL like
# my luck has desrever")
def reverse_five(str)
  result = str.split.map! do |word|
    if word.length >= 5
      word.reverse
    else
      word
    end
  end
   result.join(' ')
end

# Return an array of integers from 1 to n (inclusive), except for each multiple
# of 3 replace the integer with "fizz", for each multiple of 5 replace the
# integer with "buzz", and for each multiple of both 3 and 5, replace the
# integer with "fizzbuzz".
def fizzbuzz(n)
  solution = []

  (1..n).each do |value|
    if value % 15 == 0
      solution << 'fizzbuzz'
    elsif value % 5 == 0
      solution << 'buzz'
    elsif value % 3 == 0
      solution << 'fizz'
    else
      solution << value
    end
  end
  solution
end


# HARD

# Write a method that returns a new array containing all the elements of the
# original array in reverse order.
def my_reverse(arr)
  #arr.reverse
  solution = []
  arr.each do |ele|
    solution.unshift(ele)
  end
  solution
end

# Write a method that returns a boolean indicating whether the argument is
# prime.
require 'prime'
def prime?(num)
  Prime.prime?(num)
end

# Write a method that returns a sorted array of the factors of its argument.
def factors(num)
  (1..num).select{|val| num % val == 0}.uniq
end

# Write a method that returns a sorted array of the prime factors of its argument.
def prime_factors(num)
  factors(num).select{|val| prime?(val)}
end

# Write a method that returns the number of prime factors of its argument.
def num_prime_factors(num)
  prime_factors(num).count
end


# EXPERT

# Return the one integer in an array that is even or odd while the rest are of
# opposite parity, e.g. oddball([1,2,3]) => 2, oddball([2,4,5,6] => 5)
def oddball(arr)
  even = arr.select(&:even?)
  odd = arr.select(&:odd?)

  even.size > odd.size ? odd.last : even.last
end
