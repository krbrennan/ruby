require 'prime'

# Given an array of unique integers ordered from least to greatest, write a
# method that returns an array of the integers that are needed to
# fill in the consecutive set.

def missing_numbers(nums)
  all_nums = *((nums.first)..(nums.last))
  all_nums - nums
end

# Write a method that returns the nth prime number
def nth_prime(n)
  return nil if n == 0
  solution = [2]

  idx = 3
  until solution.size == n
    if is_prime?(idx)
      solution << idx
    end
    idx += 1
  end
  solution.last
end

def is_prime?(num)
  (2..(num / 2)).each do |ele|
    if num % ele == 0
      return false
    end
  end
  true
end

class Hash
  # Hash#select passes each key-value pair of a hash to the block (the proc
  # accepts two arguments: a key and a value). Key-value pairs that return true
  # when passed to the block are added to a new hash. Key-value pairs that return
  # false are not. Hash#select then returns the new hash.
  #
  # Write your own Hash#select method by monkey patching the Hash class. Your
  # Hash#my_select method should have the functionailty of Hash#select described
  # above. Do not use Hash#select in your method.

  def my_select(&prc)
    solution = {}

    self.each do |k,v|
      solution[k] = v if prc.call(k,v)
    end
    solution
  end
end

# A palindrome is a word or sequence of words that reads the same backwards as
# forwards. Write a method that returns the length of the longest palindrome in
# a given string. If there is no palindrome longer than two letters, return false.

def longest_palindrome(string)
  longest = nil
  length = 0

  idx = 0
  while idx < string.length - 1
    idx2 = idx + 1
    while idx2 < string.length
      if (string[idx..idx2] == string[idx..idx2].reverse) && string[idx..idx2].length > length
        length = string[idx..idx2].length
      end
      idx2 += 1
    end
    idx += 1
  end

  if length < 3
    return false
  else
    return length
  end
end

class Array
  # Write a method that calls a passed block for each element of the array
  def my_each(&prc)
    idx = 0
    while idx < self.length
      prc.call(self[idx])
      idx += 1
    end
    self
  end
end

class Array
  # Write an Array method that returns a bubble-sorted copy of an array.
  # Do NOT call the built-in Array#sort method in your implementation.
  def bubble_sort(&prc)
    arr = self.dup
    loop do
      swapped = false
      idx = 0
      while idx < arr.length - 1
        if arr[idx] > arr[idx + 1]
          arr[idx],arr[idx+1] = arr[idx+1],arr[idx]
          swapped = true
        end
        idx += 1
      end
      break if not swapped
    end
    arr
  end

  # You are not required to implement this; it's here as a suggestion :-)
  def bubble_sort!(&prc)

  end
end

# The following is a skeleton of three classes you will be asked to define to
# pass the related specs. Please read the specs carefully to determine the
# functionality and instance variables you should give each class. Show us your
# object-oriented programming skills!

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def meow
    "meow"
  end

  def receive_love
    meow
  end

end

class Dog
  BREEDS = ['Husky', 'Black Labrador', 'German Shepherd', 'Chihuahua']
  attr_accessor :name
  attr_reader :breed
  def initialize(name,breed)
    @name = name
    @breed = breed
  end

  def self.make_a_pup
    Dog.new("puppy",BREEDS.sample)
  end


  def play_with(animal)
    animal.receive_love
  end
end

class Human
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def happy?
    false
  end

  def receive_love

  end


end
