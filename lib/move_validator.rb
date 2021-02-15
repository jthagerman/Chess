require_relative 'board_controller'

class Move_validator
   
    def initialize(board,x1,y1,x2,y2)
        @board_controller = board
        @valid = false
        start_x = x1
        start_y = y1
        end_x = x2
        end_y = y2

        if(start_y == end_y)
            @valid = check_verticals(start_x,start_y,end_x,end_y)       
        elsif(start_x == end_x)
            @valid = check_horizon(start_x,start_y,end_x,end_y)    
        else
            @valid = check_diagonals(start_x,start_y,end_x,end_y)    
        end      
    end

    def check_verticals(x1,y1,x2,y2)
        start_x = x1
        start_y = y1
        end_x = x2
        end_y = y2
        
        if(start_x > end_x)
            end_x += 1
            while(end_x < start_x)
                spot = @board_controller.get_piece_at_converted_cords([end_x,end_y])
                if(spot.class != String)
                    return false
                end        
                end_x += 1
            end
            return true
        else
            start_x += 1
            while(start_x < end_x)
                spot = @board_controller.get_piece_at_converted_cords([start_x,start_y])
                if(spot.class != String)
                    return false
                end                  
            start_x += 1
            end
            return true
        end     
    end
    def check_horizon(x1,y1,x2,y2)
        start_x = x1
        start_y = y1
        end_x = x2
        end_y = y2

        if(start_y > end_y)
            end_y += 1
            while(end_y < start_y)
                spot = @board_controller.get_piece_at_converted_cords([end_x,end_y])
                if(spot.class != String)
                    return false
                end        
                end_y += 1
            end
            return true
        else
            start_y += 1
            while(start_y < end_y)
                spot = @board_controller.get_piece_at_converted_cords([start_x,start_y])
                if(spot.class != String)
                    return false
                end                  
            start_y += 1
            end
            return true
        end
    end

    def check_diagonals(x1,y1,x2,y2)
        start_x = x1
        start_y = y1
        end_x = x2
        end_y = y2

        if((start_x-end_x) > 0 && (start_y - end_y > 0))
            end_y += 1
            end_x += 1
            while(end_x < start_x)
                spot = @board_controller.get_piece_at_converted_cords([end_x,end_y])
                if(spot.class != String)
                    return false
                end 
                end_y += 1
                end_x += 1   
            end
            return true

        elsif((start_x-end_x) < 0 && (start_y - end_y < 0))

            start_y += 1
            start_x += 1
            while(start_x < end_x)
                spot = @board_controller.get_piece_at_converted_cords([start_x,start_y])
                if(spot.class != String)
                    return false
                end 
            start_y += 1
            start_x += 1   
            end
            return true

        elsif((start_x-end_x) > 0 && (start_y - end_y < 0))

            start_y += 1
            start_x -= 1
            while(start_x > end_x)
                spot = @board_controller.get_piece_at_converted_cords([start_x,start_y])
                if(spot.class != String)
                    return false
                end 
            start_y += 1
            start_x -= 1   
            end
            return true

        elsif((start_x-end_x) < 0 && (start_y - end_y > 0))

            start_y -= 1
            start_x += 1
            while(start_x < end_x)
                spot = @board_controller.get_piece_at_converted_cords([start_x,start_y])
                if(spot.class != String)
                    return false
                end 
            start_y -= 1
            start_x += 1   
            end
            return true
        end
    end

    def validate()
        return @valid
    end
end