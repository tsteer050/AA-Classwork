class Array

    def my_uniq
      array = []
      self.each do |ele|

        array << ele unless array.include?(ele)

      end
      array
    end

    def two_sum
        return_arr = []
        self.each_with_index do |ele, idx|
            self.each_with_index do |ele2, idx2|
                if self[idx] + self[idx2] == 0 && idx2 > idx
                    return_arr << [idx, idx2]
                end
            end
        end

        return_arr
    end

    def my_transpose
        return_array = Array.new(self.length) { [] }

        self.each_index do |idx|
            self.each_index do |idx2|
                return_array[idx2][idx] = self[idx][idx2]
            end
        end
        return_array
    end

end