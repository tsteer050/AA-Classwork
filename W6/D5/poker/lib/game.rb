class Game

    attr_reader :deck, :player_turn, :pot, :players
    
    def initialize(deck, players)
        @deck = deck
        @players = players
        @pot = 0
    end

    def take_bet(bet)
        @pot += bet
    end

end

