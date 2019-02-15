require_relative 'stepable'
require_relative 'piece'

class Knight < Piece
  include Stepable

  def move_diffs
    [[2, 1], [2, -1], [-2,-1], [-2, 1], [1,-2], [1, 2], [-1, 2], [-1, -2]]
  end

  def symbol
    return :k
  end

end
