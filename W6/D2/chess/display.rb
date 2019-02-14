require_relative 'cursor'
require 'colorize'
require_relative 'board'
#require 'colorized_string'
require 'byebug'
require_relative 'pieces/rook.rb'
require_relative 'pieces/queen.rb'
require_relative 'pieces/bishop.rb'
require_relative 'pieces/king.rb'
require_relative 'pieces/knight.rb'


class Display

    def initialize(board, cursor_pos)
        @board = board 
        @cursor_pos = Cursor.new([0,0], board)

    end

    def render
      @board.board.each.with_index do |row, i|
        print "|"

        row.each.with_index do |square, j|
          square_render = ""

          if square.nil?
            square_render += "_"
          else
            square_render += square.to_s
          end

          if [i,j] == @cursor_pos.cursor_pos
            print square_render.colorize(:background => :blue)
          else 
            print square_render
          end

           
           print "|"
          
        end
        puts 
      end

      return nil
    end

    def play_test
      selected_positions = []
      loop do
        system("clear")
        render 
        input = @cursor_pos.get_input
        if !input.nil?
          selected_positions << input
        end
        if selected_positions.length == 2
          begin
          @board.move_piece(selected_positions[0], selected_positions[1])
          selected_positions = []
          rescue
            puts "Not a valid move"
            sleep(1)
            selected_positions = []
          end
        end
      end
    end

end


b = Board.new 
d = Display.new(b, [0,0])
b.[]=([4,4], Knight.new(:black, [4,4], b))
d.play_test


#selecting the same end position as start position crashes us in board.move_piece