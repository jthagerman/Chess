require_relative 'piece'

class Pawn < Piece
    attr_accessor :name,:owner,:ply_num
    def initialize(ply_num,owner)
        (ply_num == 1)? @symbol = "♟︎" : @symbol = "♙"
        @ply_num = ply_num
        @owner = owner

        @name = "pawn"
    
    end

    def get_num ()
        return @ply_num
    end
    def owner()
        return @owner
    end

end