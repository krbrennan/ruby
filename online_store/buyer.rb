class Buyer
  attr_accessor :name, :funds, :inventory, :token

  def initialize(name)
    @name = name
    @funds = 0
    @inventory = []
    @token = :buyer
  end

  def add_funds
    puts "How much money would you like to add?"
    ammt = gets.chomp.to_i
    @funds += ammt
    puts "#{ammt} has been added to your account"
    puts "-------------------"
    puts "You now have #{@funds} dollars in your account"
    puts "--------------------"
  end

  def display_funds
    puts "~~~~~~~~~~~~~~~~~~~~~~~"
    puts "Your account currently has #{@funds} dollars accredited"
    puts "~~~~~~~~~~~~~~~~~~~~~~~"
  end

  def display_inventory
    puts @inventory
  end

  def what_to_do
    puts "What would you like to do?"
    puts "-------------------------"
    puts " [1] view funds \n [2] add funds \n [3] view inventory \n [4] buy something \n [5] go back to welcome screen (logout)"
    to_do = gets.chomp.to_i
    case to_do
      when 1
        display_funds
        what_to_do
      when 2
        add_funds
        what_to_do
      when 3
        display_inventory
        what_to_do
      when 4
        buy_item
        what_to_do
      when 5
        logout
      end
  end


end
