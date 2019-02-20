require_relative 'card'

class Deck

  # Returns an array of all 52 playing cards.
  def self.all_cards
    array = []
    Card.suits.each do |suit| 
      Card.values.each do |value|
        array << Card.new(suit, value)
      end
    end
    array
  end

  # Initializes with all 52 cards by default
  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def take(n)
    raise 'not enough cards' if count < n
    @cards.shift(n)
  end

  def deal_hand(player)
    cards = self.take(7)
    player.take(cards)
  end

  def empty?
    count == 0
  end
end
