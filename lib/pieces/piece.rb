class Piece

    attr_accessor :owner, :symbol

    def initialize(owner)
        @symbol = ""
        @owner = owner
    end

    def move()
        return ("0,1")
    end

    def to_s
        return @symbol
    end
end