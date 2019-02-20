class StaticArray
  attr_reader :store

  def initialize(capacity)
    @store = Array.new(capacity)
  end

  def [](i)
    validate!(i)
    self.store[i]
  end

  def []=(i, val)
    validate!(i)
    self.store[i] = val
  end

  def length
    self.store.length
  end

  private

  def validate!(i)
    raise "Overflow error" unless i.between?(0, self.store.length - 1)
  end
end

class DynamicArray

  include Enumerable 

  attr_accessor :count

  def initialize(capacity = 8)
    @store = StaticArray.new(capacity)
    @count = 0
  end

  def [](i)
    return nil if count + i < 0 || i >= @count
    idx = i
    idx = @count + i if idx < 0
    @store[idx]
  end

  def []=(i, val)
    idx = i
    idx = @count + i if idx < 0
    resize! until idx < capacity
    @store[idx] = val
    @count = idx + 1 if idx >= @count
    
  end

  def capacity
    @store.length
  end

  def include?(val)
    each do |ele|
      return true if ele == val
    end
    false
  end

  def push(val)
    resize! if count == capacity
    @store[count] = val
    @count += 1
    
  end

  def unshift(val)
    resize! if count == capacity
    i = count 
    until i == 0 
      @store[i] = @store[i-1]
      i -= 1
    end
    @store[0] = val
    @count += 1 
    
  end

  def pop
    return nil if @count == 0
    ele = @store[count-1] 
    @store[count-1] = nil
    @count -= 1
    ele
  end

  def shift
    return nil if @count == 0
    ele = @store[0]
    i = 0 
    until i == @count - 1
      @store[i] = @store[i+1]
      i += 1
    end
    @count -= 1
    @store[@count] = nil 
    ele
  end

  def first
    @store[0]
  end

  def last
    @store[count-1]
  end

  def each(&prc)
    return [] if count == 0
    i = 0 
    until i == @count
      prc.call(@store[i])
      i += 1
    end
  end

  def to_s
    "[" + inject([]) { |acc, el| acc << el }.join(", ") + "]"
  end

  def ==(other)
    return false unless [Array, DynamicArray].include?(other.class)
    return false if @count != other.count
    i = 0
    while i < @count
      return false if self[i] != other[i]
      i += 1
    end
    return true
  end

  alias_method :<<, :push
  [:length, :size].each { |method| alias_method method, :count }

  private

  def resize!
    storage = StaticArray.new(capacity * 2)
    i = 0 
    each do |ele|
      storage[i] = ele 
      i += 1
    end
    @store = storage
  end
end
