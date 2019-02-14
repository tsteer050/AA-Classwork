require_relative 'slideable'

class Bishop < Piece
  include Slideable 

  def move_dirs 
    diagonal_dirs
  end

  def symbol
    return :B
  end

end

