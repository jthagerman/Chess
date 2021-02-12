require_relative 'piece'
class King < Piece

    def initialize(ply_num,owner)
        super(owner)
        (ply_num == 1)? @symbol = "♚" : @symbol = "♔"

    end
end

a = King.new(1,"bill")
puts a