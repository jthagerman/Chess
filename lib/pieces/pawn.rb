require_relative 'piece'

class Pawn < Piece
    attr_accessor :name,:owner,:ply_num
    def initialize(ply_num,owner)
        (ply_num == 1)? @symbol = "♟︎" : @symbol = "♙"
        @ply_num = ply_num
        @owner = owner
        @name = "pawn"
        @turns = 0    
    end

    def valid_move(start_pos,end_pos,end_pos_contents)
        start_x = start_pos[0]
        start_y = start_pos[1]
        end_x = end_pos[0]
        end_y = end_pos[1]

        #black
        if(ply_num == 1)
            if(end_x >= start_x)
                return false
            end

            if(@turns == 0) && (start_x - end_x == 2) && (start_y == end_y)
                if(end_pos_contents == -1)
                    @turns += 1
                    return true
                end
            else
                if((start_x - end_x == 1))
                    if(start_y == end_y)
                        if(end_pos_contents == -1)
                            return true
                        end
                    elsif((start_y - end_y) < 2) && ((start_y - end_y) >= -1) && (end_pos_contents == 2)
                        return true
                    end
                end
            end
        #white
        else
            if(end_x <= start_x)
                return false
            end
            if(@turns == 0) && (start_x - end_x == -2) && (start_y == end_y)
                if(end_pos_contents == -1)
                    @turns += 1
                    return true
                end
            else
                if((start_x - end_x == -1))
                    if(start_y == end_y)
                        if(end_pos_contents == -1)
                            return true
                        end
                    elsif((start_y - end_y) < 2) && ((start_y - end_y) >= -1) && (end_pos_contents == 1)
                        return true
                    end
                end
            end

        end
        return false
    end

    def get_num ()
        return @ply_num
    end
    def owner()
        return @owner
    end

end