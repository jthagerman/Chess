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
        puts @board_controller
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
            get_move_piece(player_one)
            puts @board_controller
            get_move_piece(player_two)
            puts @board_controller
        end
    end

    def get_move_piece(player,repeat = false)
        if(repeat == false)
            puts "\nIt is #{player.name}'s turn, please select piece to move"
        end
        valid_piece = false
        while(!valid_piece)        
            input = gets.chomp
            if(check_valid_input(input))
                piece = @board_controller.get_piece_at_pos(input)
                if(piece.class == String)
                    puts "Please Select A Non-Empty Space"
                else
                    if(piece.get_num == player.player_number)
                        valid_piece = true
                        ###NEED TO CHECK IF THE PIECE EVEN IS MOVABLE
                    else
                         puts "That piece is not yours"
                    end
                end
            end
        end
        get_move_pos(player,input,piece)   
    end

    def get_move_pos(player,cord,piece)   

        puts "\nPlease Select Position to Move Your #{piece.name}\nType Change to Change Piece To Move"

        valid_move = false
        while(!valid_move)
            input = gets.chomp
            if (input.downcase == "change")
                puts "Please select piece to move"
                get_move_piece(player,true)
                break
            else
                if(check_valid_input(input))
                    spot = @board_controller.get_piece_at_pos(input)
                    if(spot.class == String)
                        puts "hi"
                        @board_controller.place_piece(input,piece)
                        @board_controller.place_piece(cord," ")
                        valid_move = true    
                    elsif(spot.get_num != player.player_number)

                        #need to check if valid piece move 
                        #need to convert cordinates
                        if(piece.valid_move(cord,input,spot))
                            @board_controller.place_piece(input,piece)
                            @board_controller.place_piece(cord," ")
                            valid_move = true    
                        else
                            "The #{piece.name} cannot move that way"
                        end
                    else
                        puts "Your Piece is in that spot"
                    end
                end
            end
        end
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



