 require "byebug"
 #Phase I
 
    def my_min(array)

        min = array[0]
        array.each do |num|
            min_two = num
            array.each do |num2|
                if num > num2 
                    min_two = num2
                end
            end
            if min > min_two
                min = min_two
            end
        end
        min
    end

#  list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
#  p my_min(list)  # =>  -5

 #Phase II

    def my_min_two(array)
        min = array[0]
        array.each do |num|
            min = num if num < min
        end
        min
    end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min_two(list)  # =>  -5

# # Largest Contiguous Sub-sum

#Phase I

def largest_contiguous_subsum(list)
    # debugger
    sub_arr = []
    list.each_with_index do |var, i|
        sub = []
        list.each_with_index do |var2, i2|
            if i2 >= i
                sub << var2
                sub_arr << sub.dup
            end
        end
    end

    max = sub_arr[0]
    sub_arr.each do |s|
        max = s if s.sum > max.sum
    end

    max.sum
end


# list = [5, 3, -7]
# p largest_contiguous_subsum(list) # => 8

    # possible sub-sums
    [5]           # => 5
    [5, 3]        # => 8 --> we want this one
    [5, 3, -7]    # => 1
    [3]           # => 3
    [3, -7]       # => -4
    [-7]          # => -7




# 0     7
# 6     1

# 4..-1


# -1    8


# 5     2          
# 2     5           
# list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

        

# list = [-5, -1, -3]
# p largest_contiguous_subsum(list) # => -1 (from [-1])


#Phase 2

def largest_contiguous_subsum_two(list)

    start_i = 0
    end_i = list.length-1
    value = list[0]
    list.each_index do |i|
        sub_value = list[i..-1].sum
        if sub_value >= value
            value = sub_value
            start_i = i
        end
    end
    
    until end_i == start_i
        sub_value = list[start_i..end_i].sum
        if sub_value >= value
            value = sub_value
        end
        end_i -= 1
    end


    return list.max if value < 0

    return value
end


# list = [2, 3, -6, 7, -6, 7]
# puts "===="
list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum_two(list) # => 8 (from [7, -6, 7])

        

list = [-5, -1, -3]
p largest_contiguous_subsum_two(list) # => -1 (from [-1])


