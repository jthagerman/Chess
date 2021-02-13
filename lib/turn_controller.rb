require_relative 'player' 
require_relative 'board_controller'
require_relative 'pieces/piece'
require_relative 'pieces/pawn'
require_relative 'pieces/rook'
require_relative 'pieces/knight'
require_relative 'pieces/bishop'
require_relative 'pieces/king'
require_relative 'pieces/queen'

class Turn_controller

    def initialize()
        puts "Welcome To Chess!"
        get_player_names()
        @board_controller = Board_Controller.new(@player1,@player2)
        puts @board_controller.get_board
        take_turns(@player_one,@player_two)

    end

    def get_player_names()
        puts "Player One Please Enter Your Name"
        @player_one = Player.new(get_name_input,1)
        puts "Player Two Please Enter Your Name"
        @player_two = Player.new(get_name_input,2)
        puts "\nWelcome To Chess\n\t-#{@player_one} is black\n\t-#{@player_two} is white"
        puts "\nBest of Luck To You"
    end

    def take_turns(player_one,player_two)
        while(true)
            get_turn_input(player_one)
            get_turn_input(player_two)
        end

    end

    def get_turn_input(player)
        puts "\nIt is #{player.name}'s turn, please select piece to move"
        puts player.player_number
        input = gets.chomp


        #check if it is the players piece
        while(!check_valid_input(input))        
            input = gets.chomp
        end
       
        piece = @board_controller.get_piece_at_pos(input)
        puts piece
        puts piece.get_num

 
        if(piece.get_num == player.player_number)
            puts "hi"
        end


        puts "Please Select Position to move your # {piece}"
        input = gets.chomp
        while(!check_valid_input(input))
            input = gets.chomp
        end
        puts input
    end

    def check_valid_input(input)
        if(input == "quit")
            exit(0)
        end
        input = input.split(',')
        if(input.length !=2)
            puts "Correct Input is x,y"
            return false
        else
            valid_x_axis = ["h","g","f","e","d","c","b","a"]
            valid_y_axis = [1,2,3,4,5,6,7,8]
            if(!valid_x_axis.include?(input[0]))
                puts "the y axis cordinate must be a number between a-h"
                return false
            elsif(!valid_y_axis.include?(input[1].to_i))
                puts "the y axis cordinate must be a letter between 1-8"
                return false
            end
            return true
        end   
    end

    def get_name_input()
        return (gets.chomp)
    end
end

a = Turn_controller.new()



