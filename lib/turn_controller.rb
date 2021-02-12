require_relative 'player'
class Turn_controller

    def initialize()
        puts "Welcome To Chess!"
        get_player_names()

    end

    def get_player_names()
        puts "Player One Please Enter Your Name"
        @player_one = Player.new(get_name_input,1)
        puts "Player Two Please Enter Your Name"
        @player_two = Player.new(get_name_input,2)
        puts "\nWelcome To Chess\n\t-#{@player_one}\n\t-#{@player_two}"
        puts "\nBest of Luck To You"
    end

    def get_name_input()
        return (gets.chomp)
    end
end

