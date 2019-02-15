require 'byebug'

module Slideable 

  HORIZONTAL_DIRS = [[-1, 0], [1, 0], [0, -1], [0, 1]]
  DIAGONAL_DIRS = [[-1, -1], [-1, 1], [1, 1], [1, -1]]

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs 
    DIAGONAL_DIRS
  end

  def move_dirs
  end

  def moves
   
    moves = []
    move_dirs.each do |dir|
        a,b = dir 
       moves += grow_unblocked_moves(a,b)
    end

    moves
   
  end


  private 
  
  def grow_unblocked_moves(dx, dy)#[-1, 0]
    # debugger
    moves = []
    x, y = @pos
    blocked = false 
    until blocked == true 
      x, y = x + dx, y + dy
      if !Board.valid_pos?([x,y]) 
        blocked = true
      else
        new_pos = [x, y]
        if @board[new_pos] == NullPiece.instance   
          moves << [x, y]
        else 
          color = @board[new_pos].color
          if color == @color
            blocked = true
          else
            moves << [x, y]
            blocked = true
          end
        end
      end
      
    end
    moves
  end




end