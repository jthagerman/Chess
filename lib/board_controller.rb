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

    def get_piece_at_pos(pos)
        cord = @board.convert_cords(pos)
        return @board.get_piece(cord)
    end

    def place_piece(pos,piece)
        cord = @board.convert_cords(pos)
        @board.place_piece(cord,piece)
    end


    def get_board()
        return @board.to_s
    end

    def to_s
        return @board.to_s
    end


    def check_empty_space()
        #to_do
    end


end