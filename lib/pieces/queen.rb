require_relative 'piece'
class Queen < Piece
    attr_accessor :name,:owner,:ply_num
    def initialize(ply_num,owner)
        (ply_num == 1)? @symbol = "♛" : @symbol = "♕"
        @ply_num = ply_num
        @name = "queen"
        @owner = owner
    end

    def get_num ()
        return @ply_num
    end

    def valid_move(start_pos,end_pos,end_pos_contents)
        start_x = start_pos[0]
        start_y = start_pos[1]
        end_x = end_pos[0]
        end_y = end_pos[1]

        if((start_x == end_x) || (start_y == end_y))
            return true
        end
        (1..8).each do |iter|
            if((start_x - iter) == end_x) && ((start_y + iter) == end_y)
                return true
            elsif((start_x - iter) == end_x) && ((start_y - iter) == end_y)
                return true
            elsif((start_x + iter) == end_x) && ((start_y + iter) == end_y)
                return true
            elsif((start_x + iter) == end_x) && ((start_y - iter) == end_y)
                return true
            end
        end
        return false
    end
end