require 'byebug'
#Brute Force

def bad_two_sum?(arr, target_sum)
    arr.each do |ele|
        arr.each do |ele2|
            return true if ele + ele2 == target_sum && ele != ele2
        end
    end
    false
end

# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false


#Sorting

def okay_two_sum?(arr, target_sum)
    # debugger
    arr_sorted = arr.sort
    arr_sorted.each do |ele|
        ele2 = target_sum - ele
        return true if arr_sorted.bsearch {|x| x == ele2} && ele != ele2
    end
    false
end


# arr = [0, 1, 5, 7]
# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false

def hash_two_sum?(arr, target_sum)
    # debugger
    hash = Hash.new {}
    arr.each do |ele|
        hash[ele] = target_sum - ele 
    end
    hash.each do |k, v|
        return true if hash.has_key?(v) && k != v
    end
    false
end

arr = [0, 1, 5, 7]
p hash_two_sum?(arr, 6) # => should be true
p hash_two_sum?(arr, 10) # => should be false