require_relative 'player' 
require_relative 'board_controller'
require_relative 'pieces/piece'
require_relative 'pieces/pawn'
require_relative 'pieces/rook'
require_relative 'pieces/knight'
require_relative 'pieces/bishop'
require_relative 'pieces/king'
require_relative 'pieces/queen'
require_relative 'move_validator'

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
                        if(piece.valid_move(@board_controller.convert_cords(cord),@board_controller.convert_cords(input),-1))
                            if(check_clear_path(cord,input,piece))
                                @board_controller.place_piece(input,piece)
                                @board_controller.place_piece(cord," ")
                                valid_move = true    
                            else
                                puts "pieces are in the way"
                            end
                        else
                            puts "You cannot move your #{piece.name} there."
                        end
                    elsif(spot.get_num != player.player_number)
                        if(piece.valid_move(@board_controller.convert_cords(cord),@board_controller.convert_cords(input),spot.get_num))
                            if(check_clear_path(cord,input,piece))
                                @board_controller.place_piece(input,piece)
                                @board_controller.place_piece(cord," ")
                                valid_move = true    
                            else
                                puts "pieces are in the way"
                            end  
                        else
                            puts "You cannot move your #{piece.name} there."
                        end
                    else
                        puts "Your Piece is in that spot"
                    end
                end
            end
        end
    end

    def check_clear_path(start_spot,end_spot,piece)
        start_pos = @board_controller.convert_cords(start_spot)
        end_spot = @board_controller.convert_cords(end_spot)
        start_x = start_pos[0]
        start_y = start_pos[1]
        end_x = end_spot[0]
        end_y = end_spot[1]
 
        if piece.name == "knight"
            return true       
        else
            valid = Move_validator.new(@board_controller,start_x,start_y,end_x,end_y)
            return valid.validate()
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



