class Player
  attr_reader :hand

  #Initializes with an empty hand by default
  def initialize(hand = [])
    @hand = hand
  end

  def take(cards)
    @hand += cards
  end

  def end_turn(deck)
    take(deck.take(1))
  end

  def move_pile(start_pile, target_pile)
    raise "Can't move a corner pile" if start_pile.corner == true
    start_pile.move_all(target_pile)
  end

  def play(card, pile)
    if pile.valid_move?(card)
      pile << card 
      @hand.delete(card)
      won?
    end
  end

  def won?
    @hand.empty?
  end
end
