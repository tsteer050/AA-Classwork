require 'byebug'


class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    unless include?(key)
      self[key] << key
      @count += 1
      resize! if count > num_buckets
    end
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)   
    if include?(key)
      self[key].delete(key)
      @count -= 1
    end
  end

 
  private

  def [](num)
    i = num.hash % num_buckets
    @store[i]
  end

  def num_buckets
    @store.length
  end

  def resize!
    temp_storage = []
    @store.each do |bucket|
      temp_storage.concat(bucket)
    end
    @store = Array.new(num_buckets * 2) { Array.new }
    @count = 0
    temp_storage.each { |ele| insert(ele) }
  end
  
end
