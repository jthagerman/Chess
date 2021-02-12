require_relative 'piece'
class Rook < Piece
    def initialize(ply_num,owner)
        super(owner)
        (ply_num == 1)? @symbol = "♜" : @symbol = "♖"
    end

end