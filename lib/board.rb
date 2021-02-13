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
 
    def move_piece(original,new_pos)
        original = convert_cords(original)
        new_pos = convert_cords(new_pos)
        @board[new_pos[0]][new_pos[1]] = @board[original[0]][original[1]] 
        @board[original[0]][original[1]] = " "
    end

    def convert_cords(cords)
        cords = cords.split(',')
        x = cords[1]
        y = cords[0]
        cords[0] =  convert_y_cords(x.to_i)
        cords[1] =  convert_x_cords(y)
        
        return cords
    end

    def place_piece(cord,piece)
        @board[cord[0]][cord[1]] = piece
    end

    def get_piece(cord)

        return  @board[cord[0]][cord[1]]
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

    def to_s
        left_key = [1,2,3,4,5,6,7,8]
        bottom_key = ["h","g","f","e","d","c","b","a"]
        return_str = String.new()

        @board.each_with_index do |row, row_index|
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
end

