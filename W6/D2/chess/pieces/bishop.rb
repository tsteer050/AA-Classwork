require_relative 'slideable'
require_relative 'piece'

class Bishop < Piece
  include Slideable 

  def move_dirs 
    diagonal_dirs
  end

  def symbol
    return :B
  end

end

