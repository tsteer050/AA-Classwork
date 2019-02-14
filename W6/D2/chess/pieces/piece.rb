class Piece

  attr_reader :color 
  
  def initialize(color, pos, board)
    @color = color
    @pos = pos
    @board = board
  end

  def to_s
    "#{symbol}"
  end

  def empty?
    
  end

  def symbol
    return :P
  end

  def pos=(val)
    @pos = val
  end

  def valid_moves 
    #return an array of possible moves

  end

  private

  def move_into_check?(end_pos)

  end

end

class NullPiece < Piece

end

#                Sliding
#       can move multiple times, but have to use the same move
#                   
#
# Rook    moves any number of spaces either vertically or horizontally 
# Bishop  moves any number of spaces diagonally
# Queen   has move options of both rook and bishop
# Moves = [[-1, 0], [1, 0], [0, 1], [0, -1], [1, -1], [-1, 1], [1, 1], [-1, -1]]
#
# [4, 4]  
# [5, 6]

#@diagonal_mover = false
#@horizontal_mover = true

# board.move(start_pos, end_pos)
#   if start_pos is valid  
#     if piece at that location.moves.include?(end_pos)
#       make the move 
#     end 
#   end
# end 



# piece.move 

# horizontal_or_vertical_moves = [[-1, 0], [1, 0], [0, 1], [0, -1]]
# diagonal_moves = [[1, -1], [-1, 1], [1, 1], [-1, -1]]

# [6, 7] [0, 7]

#check to see if sliding
#if so, we need to check that one type of move can get us there

#valid_move?


# horizontal_or_vertical_moves.each do |move|
#   7.times do
#     is this a valid place on the board?
#     is there a piece where I am now?
#     
#     


#     our_position + move == end position?
#             -there a piece there and is it my piece or the other person's piece?
#
#


#               Stepping

#                moves only once, using a move in moves array  

#[4, 4]

# King    moves 1 space diagonally or vertically/horizontally
# Moves = [, [1, -1], [-1, 1], [1, 1], [-1, -1]]

# Knight  moves 2 spaces horizontally/vertically in one direction 
#         and one in a perpendicular direction
#   
#               Pawn
#
# Pawn    pawn moves 1 space forward, captures 1 space diagonally forward,
#         OR moves 2 spaces forward if moving from its start location