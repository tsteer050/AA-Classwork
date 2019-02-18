#Phase I

    def first_anagram?(string, string2)
        permutations = string.split("").permutation.to_a.map(&:join)
        permutations.include?(string2)
    end


p first_anagram?("gizmo", "sally")    #=> false
p first_anagram?("elvis", "lives")    #=> true

    def second_anagram?(str1, str2)
        arr = str2.split("")
        str1.split("").each do |char|
            index = arr.find_index(char)
            return false if index.nil?
            arr.delete_at(index)
        end
        return false if !arr.empty?
        true
    end


p second_anagram?("gizmo", "sally")    #=> false
p second_anagram?("elvis", "lives")    #=> true

    def third_anagram?(str1, str2)
        str1.split("").sort == str2.split("").sort
    end

p third_anagram?("gizmo", "sally")    #=> false
p third_anagram?("elvis", "lives")    #=> true

    def fourth_anagram?(str1, str2)
        hash = Hash.new{|h,k| h[k] = 0}
        str1.each_char do |char|
            hash[char] += 1
        end

        str2.each_char do |char|
            hash[char] -= 1
        end

        hash.values.max == 0
    end


p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true

# Phase I:
# Write a method #first_anagram? that will generate and store 
# all the possible anagrams of the first string. Check if 
# the second string is one of these.

# Hints:

# For testing your method, start with small input strings, 
# otherwise you might wait a while  If you're having trouble generating 
# the possible anagrams, look into this method.
# What is the time complexity of this solution? 
# What happens if you increase the size of the strings?
