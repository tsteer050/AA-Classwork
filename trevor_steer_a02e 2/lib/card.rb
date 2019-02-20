class Card
  SUIT_STRINGS = {
    clubs: '♣',
    diamonds: '♦',
    hearts: '♥',
    spades: '♠'
  }

  VALUE_STRINGS = {
    ace: 'A',
    deuce: '2',
    three: '3',
    four: '4',
    five: '5',
    six: '6',
    seven: '7',
    eight: '8',
    nine: '9',
    ten: '10',
    jack: 'J',
    queen: 'Q',
    king: 'K'
  }

  VALUE_RANK = {
    ace: 1,
    deuce: 2,
    three: 3,
    four: 4,
    five: 5,
    six: 6,
    seven: 7,
    eight: 8,
    nine: 9,
    ten: 10,
    jack: 11,
    queen: 12,
    king: 13
  }

  # Returns an array of all suits.
  def self.suits
    SUIT_STRINGS.keys
  end

  # Returns an array of all values.
  def self.values
    VALUE_STRINGS.keys
  end

  attr_reader :suit, :value

  def initialize(suit, value)
    raise error unless Card.suits.include?(suit)
    raise error unless Card.values.include?(value)
    @suit = suit 
    @value = value
  end

  def color
    case @suit 
    when :clubs 
      return :black 
    when :spades 
      return :black 
    when :diamonds
      return :red 
    when :hearts 
      return :red 
    end
  end

  # Returns an integer value of card's rank (aces low). For example:
  # 2 of Clubs rank: 2. Jack of Hearts: 11. Ace of Spades: 1
  def rank
    VALUE_RANK[@value]
  end

  # Do not make changes to this method
  def to_s
    "#{VALUE_STRINGS[value]} #{SUIT_STRINGS[suit]}"
  end
end
