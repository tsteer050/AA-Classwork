require 'byebug'

require_relative 'p04_linked_list'

class HashMap
  include Enumerable

  attr_accessor :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    get(key) != nil
  end

  def count
    @count
  end

  def set(key, val)
    
    if include?(key)
      @store[bucket(key)].update(key, val)
    else
      @store[bucket(key)].append(key, val)
      @count += 1
      resize! if count > num_buckets
    end
  end

  def get(key)
    # debugger
    @store[bucket(key)].get(key)
  end

  def delete(key)
    if include?(key)
      @store[bucket(key)].remove(key)
      @count -= 1
    end
  end

  def each(&prc)
   
    @store.each do |bucket|
      bucket.each do |node|
        # debugger
        val = node.val 
        key = node.key 
        prc.call(key, val)
      end
    end
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    temp_storage = []
    @store.each do |bucket|
      bucket.each do |node|
        temp_storage << node
      end
    end
    @store = Array.new(num_buckets * 2) { LinkedList.new }
    @count = 0
    temp_storage.each { |ele| set(ele.key, ele.val) }
  end

  def bucket(key)
    key.hash % num_buckets
  end
end
