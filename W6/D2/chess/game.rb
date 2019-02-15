require_relative 'board'
require_relative 'display'

class Game 

    def initialize
        @board = Board.new
        @display = Display.new(@board, [0, 0])
    end

    def play
        selected_positions = []
        loop do
            system("clear")
            @display.render
            input = @display.cursor_pos.get_input
            if !input.nil?
                selected_positions << input
            end
            if selected_positions.length == 2
                begin
                    @board.move_piece(selected_positions[0], selected_positions[1])
                    selected_positions = []
                rescue CheckError => e 
                    puts e.message
                    # puts "Not a valid move"
                    sleep(1)
                    selected_positions = []
                end
            end
        end
      
    end   


end





g = Game.new
g.play






