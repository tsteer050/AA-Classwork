

class PolyTreeNode

    attr_reader :parent, :children, :value

    def initialize(value)
        @value = value
        @parent = nil
        @children = []

    end

    def parent=(parent)   
        old_parent = self.parent
        @parent = parent
        unless parent.nil?
            old_parent.children.delete(self) unless old_parent.nil?
            @parent.children << self unless @parent.children.include?(self)
        end
        
    end

    def add_child(child)
       child.parent = self
    end

    def remove_child(child)
        raise "Node is not a child of this parent" unless self.children.include?(child)  
        self.children.delete(child)
        child.parent = nil
    end

  

    def dfs(target)
        return self if self.value == target
        self.children.each do |child|
            result = child.dfs(target)
            return result unless result.nil?
        end 
        nil
    end

    def bfs(target)
        
        queue = [self]
        until queue.empty?
            if queue.first.value == target
                return queue.first 
            else
                queue += queue.first.children
                queue.shift
            end
        end
        nil

    end

end

