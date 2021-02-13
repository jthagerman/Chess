require_relative 'piece'
class Queen < Piece
    attr_accessor :name,:owner,:ply_num
    def initialize(ply_num,owner)
        (ply_num == 1)? @symbol = "♛" : @symbol = "♕"
        @name = "queen"
        @owner = owner


    end
    def get_num ()
        return @ply_num
    end
end