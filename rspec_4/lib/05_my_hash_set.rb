# MyHashSet
#
# Ruby provides a class named `Set`. A set is an unordered collection of
# values with no duplicates.  You can read all about it in the documentation:
#
# http://www.ruby-doc.org/stdlib-2.1.2/libdoc/set/rdoc/Set.html
#
# Let's write a class named `MyHashSet` that will implement some of the
# functionality of a set. Our `MyHashSet` class will utilize a Ruby hash to keep
# track of which elements are in the set.  Feel free to use any of the Ruby
# `Hash` methods within your `MyHashSet` methods.
#
# Write a `MyHashSet#initialize` method which sets an empty hash object to
# `@store`. Next, write an `#insert(el)` method that stores `el` as a key
# in `@store`, storing `true` as the value. Write an `#include?(el)`
# method that sees if `el` has previously been `insert`ed by checking the
# `@store`; return `true` or `false`.
#
# Next, write a `#delete(el)` method to remove an item from the set.
# Return `true` if the item had been in the set, else return `false`.  Add
# a method `#to_a` which returns an array of the items in the set.
#
# Next, write a method `set1#union(set2)` which returns a new set which
# includes all the elements in `set1` or `set2` (or both). Write a
# `set1#intersect(set2)` method that returns a new set which includes only
# those elements that are in both `set1` and `set2`.
#
# Write a `set1#minus(set2)` method which returns a new set which includes
# all the items of `set1` that aren't in `set2`.

class MyHashSet
  attr_reader :store

  def initialize
    @store = Hash.new(true)
  end

  def insert(ele)
    store[ele] = true
  end

  def delete(ele)
    store.delete(ele)
  end

  def include?(ele)
    store.include?(ele) ? true : false
  end

  def to_a
    store.keys.to_a
  end

  def union(new_set)
    solution_set = new_set.class.new

    self.to_a.each{|ele| solution_set.insert(ele)}
    new_set.to_a.each{|ele| solution_set.insert(ele)}
    solution_set
  end

  def intersect(set_two)
    solution_set = set_two.class.new

    self.to_a.each{|ele| solution_set.insert(ele) if set_two.include?(ele)}
    set_two.to_a.each{|ele| solution_set.insert(ele) if self.include?(ele)}
    solution_set
  end

  def minus(set_two)
    solution_set = self.class.new
    set_two = set_two.to_a

    self.to_a.each{|ele| solution_set.insert(ele) unless set_two.include?(ele)}
    solution_set
  end

  def symmetric_difference(set2)
    solution_set = self.class.new

    set1 = self.to_a
    set2 = set2.to_a
    common_items = set1 & set2
    unique_items = (set1 - common_items) + (set2 - common_items)

    unique_items.each{|ele| solution_set.insert(ele)}
    solution_set
  end


  def ==(object)
    is_object = object.is_a?(MyHashSet)
    same_size = self.to_a.size == object.to_a.size
    all_in = object.to_a.all?{|ele| self.to_a.include?(ele)}

    is_object && same_size && all_in
  end
end




# Bonus-----DONE
#
# - Write a `set1#symmetric_difference(set2)` method; it should return the
#   elements contained in either `set1` or `set2`, but not both!
# - Write a `set1#==(object)` method. It should return true if `object` is
#   a `MyHashSet`, has the same size as `set1`, and every member of
#   `object` is a member of `set1`.
