class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    hash = 0
    self.each_with_index do |el, i|
      hash += el.hash * i.hash
    end
    hash
  end
end

class String
  def hash
    self.bytes.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  
  def hash
    hash = 0
    self.each { |k, v| hash += (k.to_s.hash * v.hash) }
    hash
  end
end

# num = nil
# hash = "asdfaat".hash.each.with_index |byte, i|
  
#   unless num.nil? 
#     num = num ^ byte
#   end
#   num ||= byte
# end
# p hash

# "cat"