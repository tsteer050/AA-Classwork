require_relative 'hand'

class Player
    
    attr_reader :hand

    def initialize(hand)
        @hand = hand
    end

end