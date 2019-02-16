require 'player'
require 'hand'

describe Player do
    subject(:player) { Player.new(new_hand) }
    let(:new_hand) {"hand"}

    it "stores the player's hand" do 
        hand = class_double(Hand)
        let(:test_player) { Player.new(hand) }
        expect(test_player.hand).to be_a(Hand)
    end

end

