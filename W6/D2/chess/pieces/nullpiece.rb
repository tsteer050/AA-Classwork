require 'singleton'
require_relative 'piece'

class NullPiece < Piece
   
    include Singleton

    def initialize
       
    end


    def symbol
        return :_
    end 

    def moves
        []
    end

end