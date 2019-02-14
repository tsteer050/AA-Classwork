require_relative 'pieces/piece.rb'

class Board
    
  def self.set_up_board
        grid = Array.new(8) { Array.new(8) }

        grid.each_index do |i| 
          grid.each_index do |j|
            if i <= 1 || i >= 6 
              grid[i][j] = Piece.new(:white, [i,j], self)
            end
          end
        end
        grid
  end

    def self.valid_pos?(pos)
        pos.all? {|num| (0..7).include?(num)}
    end

    attr_reader :board

    def initialize
      @board = Board.set_up_board
  
    end

    def move_piece(start_pos, end_pos)
        raise "Start and end position must be different" if start_pos == end_pos
        start_piece = self[start_pos]
        end_piece = self[end_pos]
        raise "Invalid start position" if start_piece.nil?
        raise "Invalid end position" unless end_piece.nil?
        if start_piece.moves.include?(end_pos)
          self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
          self[end_pos].pos = end_pos
        end
    end

    def [](pos)
      row, col  = pos
      @board[row][col]
    end

    def []=(pos, value)
      row, col  = pos
      @board[row][col] = value
    end

    

end




# b = Board.new 
# b.move_piece([5,0],[4,0])

# p b.board