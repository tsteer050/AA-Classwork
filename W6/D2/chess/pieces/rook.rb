require_relative 'slideable'

class Rook < Piece
  include Slideable 

  def move_dirs 
    horizontal_dirs
  end

  def symbol
    return :r
  end

end


