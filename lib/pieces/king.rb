require_relative 'piece'
class King < Piece
    attr_accessor :name,:owner,:ply_num

    def initialize(ply_num,owner)

        (ply_num == 1)? @symbol = "♚" : @symbol = "♔"
        @owner = owner
        @ply_num = ply_num

        @name = "King"
    end
    def get_num ()
        return @ply_num
    end
end
