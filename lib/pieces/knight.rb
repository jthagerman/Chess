require_relative 'piece'
class Knight < Piece

    def initialize(ply_num,owner)
        super(owner)
        (ply_num == 1)? @symbol = "♞" : @symbol = "♘"


    end

end