class Player
    attr_accessor :name, :player_number

    def initialize(name,player_number)
        @name = name
        @player_number = player_number
    end

    def to_s
        return @name
    end
end