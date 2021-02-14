class Board

    def initialize(board=nil)
        (board == nil)? @board = Array.new(8){Array.new(8){" "}} : @board = board
    end

    def to_json
        JSON.dump ({
          :board => @board
        })
    end

    def self.from_json(string)
        data = JSON.load string
        self.new(data['board'])
    end
 
    def place_piece(cord,piece)
        @board[cord[0]][cord[1]] = piece
    end

    def get_piece(cord)
        return  @board[cord[0]][cord[1]]
    end

    def get_board()
        return @board
    end
end

