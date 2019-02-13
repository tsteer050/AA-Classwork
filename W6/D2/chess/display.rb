require_relative 'cursor'
require 'colorize'
require_relative 'board'
#require 'colorized_string'
require 'byebug'


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
            square_render += square.type.to_s
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

    # def play_test
    #   loop do
    #     system("clear")
    #     render 
    #     @cursor_pos.get_input
    #     p @cursor_pos.cursor_pos
    #   end
    # end

end

b = Board.new 
d = Display.new(b, [0,0])
d.play_test
