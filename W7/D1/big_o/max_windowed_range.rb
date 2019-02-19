require 'byebug'

#Phase I

def windowed_max_range(arr, w)
    current_max_range = nil
    arr.each_with_index do |el, i|
        next if i+w > arr.length 
        window_arr = arr[i...i+w]
        difference = window_arr.max - window_arr.min
        current_max_range ||= difference
        current_max_range = difference if difference > current_max_range
    end
    current_max_range
end


# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # [4, 8]
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # [0, 2, 5]
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # [2, 5, 4, 8]
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # [3, 2, 5, 4, 8]

#Phase II

class MyQueue 

    def initialize
        @store = []
    end

    def peek 
        @store.first
    end

    def size
        @store.length
    end

    def empty?
        size == 0
    end

    def enqueue(ele)
        @store.push(ele)
    end

    def dequeue(ele)
        @store.shift(ele)
    end

end

#Phase III

class MyStack
    def initialize
        @store = []
    end

    def peek 
        @store.first
    end

    def size
        @store.length
    end

    def empty?
        size == 0
    end

    def pop
        @store.pop
    end

    def push(ele)
        @store.push(ele)
    end

end

#Phase IV

def StackQueue
    
    def initialize
        @stack1 = MyStack.new
        @stack2 = MyStack.new
    end

    def size
        @stack1.size
    end

    def empty?
        @stack1.empty?
    end

    def enqueue(ele)
        until empty?
            @stack2.push(@stack1.pop)
        end
        @stack1.push(ele)
        until @stack2.empty?
            @stack1.push(@stack2.pop)
        end
    end

    def dequeue(ele)
        @stack1.pop
    end

end

#Phase V

class MinMaxStack
    def initialize
        @store = []
        @max_stack = []
        @min_stack = []
    end

    def peek 
        @store.first
    end

    def size
        @store.length
    end

    def empty?
        size == 0
    end

    def pop
        @max_stack.pop if peek == @max_stack.last
        @min_stack.pop if peek == @min_stack.last
        @store.pop
    end

    def push(ele)
        @store.push(ele)
        @max_stack.push(ele) if @max_stack.empty? || ele > @max_stack.last
        @min_stack.push(ele) if @min_stack.empty? || ele < @min_stack.last
    end

    def max
        @max_stack.last
    end

    def min
        @min_stack.last
    end

end

#Phase VI


class MinMaxStackQueue
    
    def initialize
        @stack1 = MinMaxStack.new
        @stack2 = MinMaxStack.new
    end

    def size
        @stack1.size
    end

    def empty?
        @stack1.empty?
    end

    def enqueue(ele)
        until empty?
            @stack2.push(@stack1.pop)
        end
        @stack1.push(ele)
        until @stack2.empty?
            @stack1.push(@stack2.pop)
        end
    end

    def dequeue
        @stack1.pop
    end

    def max
        @stack1.max
    end

    def min
        @stack1.min
    end

end

#Phase VII




def stacked_windowed_max_range(arr, w)
    stack = MinMaxStackQueue.new
    current_max_range = nil
    arr.each_with_index do |el, i|
        stack.enqueue(el)
        if stack.size > w
            stack.dequeue
        end
        if stack.size == w
            difference = stack.max - stack.min
            current_max_range ||= difference
            current_max_range = difference if difference > current_max_range
        end
    end
    current_max_range
end




p stacked_windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # [4, 8]
p stacked_windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # [0, 2, 5]
p stacked_windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # [2, 5, 4, 8]
p stacked_windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # [3, 2, 5, 4, 8]