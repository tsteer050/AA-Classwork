require_relative 'pieces/pieces.rb'
require 'byebug'


class Board

   def self.valid_pos?(pos)
        pos.all? {|num| (0..7).include?(num)}
  end

  attr_accessor :board

  def initialize
    @board = Array.new(8) { Array.new(8) }
    @board = set_up_board(@board)
    @sentinel = NullPiece.instance
  
  end

  def set_up_board(grid)

    grid.each_index do |x| 
      grid.each_index do |y|
        if x == 1 
          grid[x][y] = Pawn.new(:black, [x,y], self)
        elsif x == 6
          grid[x][y] = Pawn.new(:white, [x,y], self)
        elsif x > 1 && x < 6
          grid[x][y] = NullPiece.instance
        end
      end
    end   

    back_pieces = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
    back_pieces.each.with_index do |piece, idx|
      grid[7][idx] = piece.new(:white, [7, idx], self)
      grid[0][idx] = piece.new(:black, [0, idx], self)
    end

    grid
  end

  def checkmate?(color)
     @board.each.with_index do |row, x| 
      row.each.with_index do |col, y|
        piece = @board[x][y]
        if piece.color == color 
          return false if piece.valid_moves.length > 0 
        end
      end
    end
    return true
  end

  def in_check?(color)
    king_pos = find_the_king(color)
 
    @board.each.with_index do |row, x| 
      row.each.with_index do |col, y|
        piece = @board[x][y]
        if piece.color != color && piece != @sentinel
          return true if piece.moves.include?(king_pos)
        end
      end
    end
    false
  end

  def find_the_king(color)
    king = nil 
    @board.each.with_index do |row, x| 
      row.each.with_index do |col, y|
        if @board[x][y].is_a?(King) && @board[x][y].color == color
          king = [x, y]
        end
      end
    end
    king
  end


  

    def move_piece!(start_pos, end_pos)
        raise "Start and end position must be different" if start_pos == end_pos
        start_piece = self[start_pos]
        end_piece = self[end_pos]
    
        if start_piece.moves.include?(end_pos)
          self[start_pos], self[end_pos] = @sentinel, self[start_pos]
          self[end_pos].pos = end_pos
        end
      end
    

    def move_piece(start_pos, end_pos)
        raise "Start and end position must be different" if start_pos == end_pos
        start_piece = self[start_pos]
        end_piece = self[end_pos]
    
        if start_piece.valid_moves.include?(end_pos)
          self[start_pos], self[end_pos] = @sentinel, self[start_pos]
          self[end_pos].pos = end_pos
        else
          raise CheckError.new("This move will leave you in check") 
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

    def dup 
      new_board = Board.new
      pieces = [Rook, Knight, Bishop, Queen, King, Pawn]

      @board.each.with_index do |row, x|
        row.each.with_index do |col, y|
          # debugger
         
          old_piece = @board[x][y]
          changed = false
          pieces.each do |piece|

            if old_piece.is_a?(piece)
              new_board.board[x][y] = piece.new(old_piece.color, old_piece.pos.dup, new_board)
              changed = true
            end

          end
          if changed == false 
            new_board.board[x][y] = @sentinel
          end 
        end

      end
      new_board
    end

end




# b = Board.new 
# b.move_piece([5,0],[4,0])

# p b.board
