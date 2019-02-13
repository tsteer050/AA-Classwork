require_relative 'cursor'
require 'colorize'
#require 'colorized_string'


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
            square_render.colorize(:background => :blue)
          end

           print square_render
           print "|"
          
        end
        puts 
      end
      p "hello there".blue
      return nil
    end

    # def render
    #   @board.board.each.with_index do |row, i|
    #     display_row = "|"

    #     row.each.with_index do |square, j|
    #       square_render = ""

    #       if square.nil?
    #         square_render += "_"
    #       else
    #         square_render += square.type.to_s
    #       end
         
    #       if [i,j] == @cursor_pos.cursor_pos
    #         square_render.colorize(:background => :blue)
    #       end

    #        display_row += square_render
    #        display_row += "|"
          
    #     end
    #     p display_row
    #   end
    #   return nil
    # end



end

