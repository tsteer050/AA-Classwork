require 'game'

describe Game do 

    let(:players) { [double("player_1"), double("player_2")] }
    let(:deck) { double("deck") }
    let(:player) { double(player) }
    subject(:game) { Game.new(deck, players) }
   
    
    
    it "holds the deck" do 
        expect(game.deck).to eq(deck)
    end


    it "holds the players" do 
        expect(game.players).to be_a(Array)
    end 

    it "keeps track of the amount in the pot" do 
        expect(game.pot).not_to eq(nil)
    end

    it "accepts bets from players" do 
        game.take_bet(100)
        expect(game.pot).to eq(100)
    end

end