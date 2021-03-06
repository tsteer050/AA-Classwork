require_relative 'slideable'
require_relative 'piece'

class Queen < Piece
  include Slideable 

  def move_dirs 
    horizontal_dirs + diagonal_dirs
  end

  def symbol
    return :Q
  end

end

