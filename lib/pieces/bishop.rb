require_relative 'piece'
class Bishop < Piece
    def initialize(ply_num,owner)
        super(owner)
        (ply_num == 1)? @symbol = "♝" : @symbol = "♗"
    end

end