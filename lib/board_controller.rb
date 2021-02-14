require_relative 'board'
require_relative 'pieces/piece'
require_relative 'pieces/pawn'
require_relative 'pieces/rook'
require_relative 'pieces/knight'
require_relative 'pieces/bishop'
require_relative 'pieces/king'
require_relative 'pieces/queen'

class Board_Controller

    def initialize(player1,player2)
        @board = Board.new()
        fillBoard(player1,player2)
    end
    def fillBoard(player1,player2)
        #pawns
        (0..7).each do |el| 
            @board.place_piece([1,el],Pawn.new(2,player2))  
            @board.place_piece([6,el],Pawn.new(1,player1))
        end
        #rooks
        @board.place_piece([0,0],Rook.new(2,player2))
        @board.place_piece([0,7],Rook.new(2,player2))
        @board.place_piece([7,0],Rook.new(1,player1))
        @board.place_piece([7,7],Rook.new(1,player1))
        #knights
        @board.place_piece([0,1],Knight.new(2,player2))
        @board.place_piece([0,6],Knight.new(2,player2))
        @board.place_piece([7,1],Knight.new(1,player1))
        @board.place_piece([7,6],Knight.new(1,player1))
        #bishops
        @board.place_piece([0,2],Bishop.new(2,player2))
        @board.place_piece([0,5],Bishop.new(2,player2))
        @board.place_piece([7,2],Bishop.new(1,player1))
        @board.place_piece([7,5],Bishop.new(1,player1))
        #king
        @board.place_piece([0,4],King.new(2,player2))
        @board.place_piece([7,4],King.new(1,player1))
        #queen
        @board.place_piece([0,3],Queen.new(2,player2))
        @board.place_piece([7,3],Queen.new(1,player1))
    end

    def convert_cords(cords)
        cords = cords.split(',')
        x = cords[1]
        y = cords[0]
        cords[0] =  convert_y_cords(x.to_i)
        cords[1] =  convert_x_cords(y)
        
        return cords
    end
         
    def convert_y_cords(cord)
        y_axis_key = { 8 => 0, 7 => 1,6 => 2,5 => 3,4 => 4,3 => 5,2 => 6,1 => 7}
        return y_axis_key[cord]
    end

    def convert_x_cords(cord)
        cord = cord.downcase
        x_axis_key = { "a" => 0, "b" => 1,"c" => 2,"d" => 3,"e" => 4,"f" => 5,"g" => 6,"h" => 7}
        return x_axis_key[cord]
    end


    def get_piece_at_pos(pos)
        cord = convert_cords(pos)
        return @board.get_piece(cord)
    end

    def place_piece(pos,piece)
        cord = convert_cords(pos)
        @board.place_piece(cord,piece)
    end


    def get_board()
        return @board.to_s
    end
     
    def to_s
        left_key = [1,2,3,4,5,6,7,8]
        bottom_key = ["h","g","f","e","d","c","b","a"]
        return_str = String.new()

        @board.get_board().each_with_index do |row, row_index|
            return_str +="\n\t  "
            return_str += ("─" * 33 )
            return_str +="\n\t#{left_key.pop} "
            row.each_with_index do |column, column_index|
                return_str += "│ #{column} "
            end
            return_str +="│"
        end
        return_str +="\n\t  "
        return_str += ("─" * 33 )
        return_str +="\n\t  "
        while(bottom_key.length > 0)
            return_str += ("  #{bottom_key.pop} ")
        end
        return_str +="\n"
        return return_str
    end
  


    def check_empty_space()
        #to_do
    end


end