require_relative 'piece'

class Pawn < Piece
    attr_accessor :name,:owner,:ply_num
    def initialize(ply_num,owner)
        (ply_num == 1)? @symbol = "♟︎" : @symbol = "♙"
        @ply_num = ply_num
        @owner = owner
        @name = "pawn"

        #MOVES VARIABLE
    
    end
    def valid_move(start_pos,end_pos,end_pos_contents)
        start_x = start_pos[0]
        start_y = start_pos[1]
        end_x = end_pos[0]
        end_y = end_pos[1]

        #black
        if(ply_num == 1)
            #begining space
            if(start_x == 6)
                if(start_y-end_y > 2) ||(start_x)
                    return false
                end 
            else
            end

        #white
        else

        end

    end

    def get_num ()
        return @ply_num
    end
    def owner()
        return @owner
    end

end