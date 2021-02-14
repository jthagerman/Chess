require_relative 'piece'
class Rook < Piece
    attr_accessor :name,:owner,:ply_num
    def initialize(ply_num,owner)
        (ply_num == 1)? @symbol = "♜" : @symbol = "♖"
        @owner = owner
        @ply_num = ply_num
        @name = "rook"
    end

    def valid_move(start_pos,end_pos,end_pos_contents)
        start_x = start_pos[0]
        start_y = start_pos[1]
        end_x = end_pos[0]
        end_y = end_pos[1]
        puts start_x
        puts start_y
        puts end_x
        puts end_y

        if((start_x == end_x) || (start_y == end_y)) && (end_pos_contents.ply_num != ply_num)
            return true
        else
            return false
        end
    end

    def get_num ()
        return @ply_num
    end

end