require 'array'

describe Array do 
    subject(:array) { [1, 5, 5, 3] }

    describe "#my_uniq" do 

        it "returns a new array" do
            expect(array.my_uniq).not_to be(array)
        end

        it "should remove duplicate elements" do 
            expect(array.my_uniq.length).to eq(3)
        end

        it "returns elements in the order they appeared" do 
            expect(array.my_uniq[-1]).to eq(3)
        end

    end

    describe "#two_sum" do
        let(:sum_array) { [1, -1, 3, 5, -3, 7, -1] }

        it "returns an array of positions" do 
            test_indices = sum_array.two_sum
            all_positions = test_indices.all? { |pair| pair.is_a?(Array) && pair.length == 2 }
            expect(all_positions).to be true 
        end

        it "returns indices where elements add to 0" do
            test_indices = sum_array.two_sum
            add_to_zero = test_indices.all? { |pair| sum_array[pair[0]] + sum_array[pair[1]] == 0 }  
            expect(add_to_zero).to be true
        end

        it "ensures the lower index is first in the pair" do 
            lowest_first = sum_array.two_sum.all? { |pair| pair[0] < pair[1] }
            expect(lowest_first).to be true
        end

        it "organizes positions lowest to highest, prioritizing the first index" do 
            expect(sum_array.two_sum[0]).to eq([0,1])
        end
      

    end

    describe "#my_transpose" do
        let(:trans_array) { [[1, 2, 3], [4, 5, 6], [7, 8, 9]] }


        it "returns a two-dimensional array" do 
            expect(trans_array.my_transpose[0]).to be_a(Array)
        end

        it "keeps the center element the same" do 
            expect(trans_array.my_transpose[1][1]).to eq(5)
        end 

        it "switches the rows and columns of the grid" do
            expect(trans_array.my_transpose).to eq([[1, 4, 7], [2, 5, 8], [3, 6, 9]])
        end


    end

end

