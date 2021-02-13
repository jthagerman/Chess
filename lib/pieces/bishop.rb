require_relative 'piece'
class Bishop < Piece

    attr_accessor :name,:owner,:ply_num
    def initialize(ply_num,owner)

        (ply_num == 1)? @symbol = "♝" : @symbol = "♗"
        @owner = owner

        @name = "Bishop"
    end
    def get_num ()
        return @ply_num
    end

end