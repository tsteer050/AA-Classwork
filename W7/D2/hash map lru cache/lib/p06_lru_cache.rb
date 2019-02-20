require_relative 'p05_hash_map'
require_relative 'p04_linked_list'
require 'byebug'

class LRUCache
  attr_reader :prc
  def initialize(max, prc=Proc.new { |x| x ** 2 })
    @map = HashMap.new  #this is the map.  it helps you find an answer in the cache
    @store = LinkedList.new  #this is the cache.  this takes time to look through
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    # debugger
    if @map.include?(key)
      node = @map[key]
      update_node!(node)
      return node.val
    else
      #add to map and cache
      calc!(key)
  
    end
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    # debugger
    val = prc.call(key)
    last = @store.append(key, val)
    @map.set(key, last)
    if count > @max
      eject!
    end
    return val
  end

  def update_node!(node)
    # @store.remove(node.key)
    node.remove
    updated = @store.append(node.key, node.val)
    @map[updated.key] = updated
  end

  def eject!
    removal_key = @store.first.key
    @map.delete(removal_key)
    @store.first.remove
  end
end

# # Instructions:
# # Let's say we're building an LRU cache that's going to cache the values
#  of the perfect squares. So our LRU cache will store a @prc, which in this 
#  case will be . If we don't have the value of any 
#  number's square, we'll use this Proc to actually compute it. But we 
#  don't want to compute it for the same number twice, so after I compute 
#  anything, I'll store it in my LRU cache. But if my LRU Cache gets an
#   input that doesn't exist in the cache, it'll compute it using the Proc.
# # Now build your LRU cache. Every time you add a new key-value pair to
#  your cache, you'll take two steps.
# # First, look to see if the key points to any node in your hash map. 
# If it does, that means that the item exists in your cache. Before you 
# return the value from the node though, move the node to the very end 
# of the list (since it's now the most recently used item).
# # Say the key isn't in your hash map. That means it's not in your 
# cache, so you need to compute its value and then add it. That has two parts.
# # First, you call the proc using your key as input; the output will 
# be your key's value. Append that key-value pair to the linked list 
# (since, again, it's now the most recently used item). Then, add the 
# key to your hash, along with a pointer to the new node. Finally, you 
# have to check if the cache has exceeded its max size. If so, call 
# theeject! function, which should delete the least recently used item 
# so your LRU cache is back to max size.
# # Hint: to delete that item, you have to delete the first item in your 
# linked list, and delete that key from your hash. Implemented correctly, 
# these should both happen in O(1) time.
# # And you did it! Congratulations! Celebrate by getting a code review!


