

class Card
  SUITS = [
    :heart,
    :spade,
    :diamond,
    :club
  ]

  VALUES = [
    :two,
    :three,
    :four,
    :five,
    :six,
    :seven,
    :eight,
    :nine,
    :ten,
    :jack,
    :queen,
    :king,
    :ace
  ]
  attr_reader :value, :suit, :card
  def initialize(value,suit)
    @value = value
    @suit = suit
  end

end

class Deck
  attr_reader :deck
  def initialize(deck=create_deck)
    @deck = deck
  end

  def create_deck
    cards = []

    Card::SUITS.each do |suit|
        Card::VALUES.each do |value|
          cards << Card.new(value,suit)
        end
    end
    cards.shuffle
  end

end
