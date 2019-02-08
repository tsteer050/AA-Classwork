require_relative '00_tree_node'
require 'byebug'

class KnightPathFinder

    attr_reader :root_node

    def self.root_node(pos)
        PolyTreeNode.new(pos)
    end
    
    def self.valid_moves(pos)
        x, y = pos
        moves = [[2, 1], [2, -1], [1, 2], [-1, 2], [-2, -1], [-2, 1], [-1, -2], [1, -2]]
        moves.map { |pos| [pos[0] + x, pos[1] + y] }.select do |position|
            a, b = position
            (a >= 0 && a <= 7) && (b >= 0 && b <= 7)
        end     
    end

    def initialize(start_pos)
        @start_pos = start_pos
        @root_node = KnightPathFinder.root_node(start_pos)
        @considered_positions = [@start_pos]
    end

    def new_move_positions(pos)
        valid = KnightPathFinder.valid_moves(pos)
        new_moves = valid.select do |position|
            position unless @considered_positions.include?(position)
        end
        @considered_positions += new_moves
        new_moves
    end

    def build_move_tree
        # debugger
        queue = [self.root_node]
        until queue.empty?
            node = queue.first
            moves = new_move_positions(node.value)
            moves.each do |move|
                node.add_child(PolyTreeNode.new(move)) unless moves.empty?
            end
            queue += node.children
            queue.shift            
        end
    end

    def find_path(end_position)
        end_node = self.root_node.bfs(end_position)
        trace_path_back(end_node)
    end

    def trace_path_back(node)
        return [node.value] if node.parent == nil
        path = trace_path_back(node.parent)
        path << node.value
    end

 
end

class Game

    def initialize

    end

     def play
        puts "Please enter a starting position"
        start_pos = gets.chomp.split(",").map(&:to_i)

        finder = KnightPathFinder.new(start_pos)
        puts "Please enter an ending position"
        end_pos = gets.chomp.split(",").map(&:to_i)

        finder.build_move_tree
        p finder.find_path(end_pos)
    end


end

game = Game.new
game.play

