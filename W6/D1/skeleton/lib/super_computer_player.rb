require_relative 'tic_tac_toe_node'
require 'byebug'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    
    new_board = game.board.dup
    new_node = TicTacToeNode.new(new_board, mark)
    new_node.children.each do |child|
      # debugger
      return child.prev_move_pos if child.winning_node?(mark)
    end
    new_node.children.each do |child|
      return child.prev_move_pos unless child.losing_node?(mark)
    end
    raise "There are no good moves"
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
