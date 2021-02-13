class Player
    attr_accessor :name, :player_number

    def initialize(name,player_number)
        if(name == "")
            @name = "Player #{player_number}"
        else
            @name = name
        end
        @player_number = player_number
    end

    def to_s
        return @name
    end
end