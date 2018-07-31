######!/usr/bin/env ruby
require_relative 'seller'
require_relative 'buyer'
require_relative 'inventory'
class Store

  def initialize
    @inventory = inventory
  end


  def start


  end



end

store = Store.new

print "Are you a buyer or a seller?"
identity = gets.chomp.strip
store = Store.new(buttplug: 50, chicken: 10, car: 100)
store.display
loop do
  if identity.downcase == "buyer"
    print "What is your name?"
      name = gets.chomp.strip
    print "How much money would you like to add to your account?"
      funds = gets.chomp.to_i
      buyer = Buyer.new(name, funds)
    print "would you like to BROWSE inventory, ADD money, or REVIEW funds?"
      response = gets.chomp
      if response == "browse"
          store.display
      # elsif response == add
      #
      #
      # elsif response == review

      end
  else
    print "What is your name?"
    name = gets.chomp.strip
    seller = Seller.new(name)
  end
end

  # new_order = Store.new(identity, name)
  # new_order.inquiry
