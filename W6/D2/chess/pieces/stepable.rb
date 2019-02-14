require 'byebug'

module Stepable

    def moves
        moves = []
        move_diffs.each do |diff|
            x, y = @pos
            dx, dy = diff
            x, y = x + dx, y + dy
            new_pos = [x, y]
            
            if Board.valid_pos?(new_pos)
                if @board[new_pos] == nil
                    moves << new_pos
                elsif @board[new_pos].color != @color
                    moves << new_pos
                end
                # moves << new_pos
            end
        end

        moves
    end
#                               [4, 4]
    #[[6, 5], [6, 3], [2, 3], [2, 5], [5, 2], [5, 6], [3, 6], [3, 2]]

    def move_diffs

    end

end
