class Piece
  attr_reader :type
  
  def initialize
    @type = :p

  end

end

class NullPiece < Piece

end