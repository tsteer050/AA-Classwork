require 'stock'

describe "#stock_picker" do
    subject(:prices) { [50, 23, 11, 65, 102, 48] }

    it "returns an array of days" do 
        expect(stock_picker(:prices)).to be_a(Array)
    end

    it "doesn't try to sell before buying" do 
        expect(stock_picker(:prices)[0]).to be < (stock_picker(:prices)[1])
    end

    it "picks the combination of days that lead to the highest profit" do 
        expect(stock_picker(:prices)).to eq([2, 4])
    end

end
