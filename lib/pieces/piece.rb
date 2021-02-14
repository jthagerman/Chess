require_relative '../player'
class Piece

    attr_accessor :owner, :symbol

    def initialize(ply_num,owner)
        @symbol = ""
        @owner = owner
        @ply_num = ply_num
    end

    def move()
        return ("0,1")
    end

    def get_owner
        return @owner
    end

    def get_num
        return @ply_num
    end

    def to_s
        return @symbol
    end
end