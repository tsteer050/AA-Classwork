require_relative 'tic_tac_toe'
require "byebug"
class TicTacToeNode

  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos

  end


  def losing_node?(evaluator)
    # debugger
    if board.won? && board.winner == evaluator 
      return false
    elsif board.won? && board.winner != evaluator
      return true   
    elsif board.over? 
      return false  
    else
      children.any? { |e| e.losing_node?(evaluator) }
    end
  end

  def winning_node?(evaluator)
    if board.won? && board.winner == evaluator 
      return true
    elsif board.won? && board.winner != evaluator
      return false  
    elsif board.over? 
      return true  
    else
      children.none? { |e| e.losing_node?(evaluator) }
    end
  
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    new_next_mark = self.next_mover_mark
    if new_next_mark == :x
      new_next_mark = :o
    else
      new_next_mark = :x
    end
    positions = [ [0,0],[0,1],[0,2],[1,0],[1,1],[1,2],[2,0],[2,1], [2,2] ]
 
    children = []
    
    positions.each do |pos|
        new_board = board.dup
        next if new_board[pos] != nil
        new_board[pos] = new_next_mark 
        children << TicTacToeNode.new(new_board, new_next_mark, pos) 
    end
    children
  end



end
