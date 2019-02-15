require_relative 'piece'
require 'byebug'

class Pawn < Piece 

    def symbol
        return :p
    end

    def moves
        possible_moves = forward_steps + side_attacks
        moves = []
 
        possible_moves.each do |diff|
            row, col = @pos
            drow, dcol = diff
            row, col = row + drow, col + dcol
            new_pos = [row, col]
            
            if Board.valid_pos?(new_pos)
                if @board[new_pos] == NullPiece.instance
                    moves << new_pos
                elsif @board[new_pos].color != @color
                    moves << new_pos
                end
                # moves << new_pos
            end
        end

        moves
    end

    def opposite_color
        if @color == :white 
            return :black 
        else 
            return :white 
        end
    end

    private

    def forward_dir
        if @color == :white 
            return -1
        else
            return 1
        end
    end

    def forward_steps

        steps = []
        steps << [forward_dir, 0]

        if at_start_row? 
          steps << [forward_dir * 2, 0]
        end
        steps 

    
    end

    def side_attacks
       x, y = @pos

       valid_attacks = []
       potential_moves = [[forward_dir, - 1], [forward_dir, 1]]

       potential_moves.each do |move| 
            dx, dy = move
            new_pos = [x + dx, y + dy]

            if Board.valid_pos?(new_pos)
                color = @board[new_pos].color
                if color == opposite_color
                    valid_attacks << move
                end
            end
       end
       valid_attacks
    end

    def at_start_row?

        if @color == :white && @pos[0] == 6 
          return true 
        elsif @color == :black && @pos[0] == 1 
          return true 
        else 
          false 
        end

    end

end