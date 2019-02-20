class Pile
  attr_reader :corner
  attr_accessor :cards

  # Initializes as an empty regular pile by default
  def initialize(corner = false, cards = [])
    @corner = corner 
    @cards = cards
  end

  def empty?
    @cards.empty?
  end

  def top_card
    return nil if empty?
    @cards.last
  end

  def bottom_card
    return nil if empty?
    @cards.first
  end
  
  def valid_move?(card)
    if !empty?
      if card.rank == top_card.rank - 1 && card.color != top_card.color 
      return true 
      end
    else
      if @corner == true && card.value == :king && empty?
        return true
      elsif @corner == false 
        return true 
      end
    end
    false
  end

  def move_all(to_pile)
    raise "Invalid pile move" unless to_pile.valid_move?(self.bottom_card)
    to_pile.cards += @cards 
    @cards = []
  end

  def <<(card)
    cards << card
  end
end
