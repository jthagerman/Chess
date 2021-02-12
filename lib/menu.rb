class Menu
    require_relative 'turn_controller'
    
    def initialize()
       setup_game()
    end

    def setup_game()
        puts "\n\nWelcome to Chess, would you like to:\n\t1) start game"
        puts "\t2) load game"
        puts "\t3) quit game"
        
        case(gets.chomp.downcase)
            when '1'
                start_game()
            when '2'
                load_game()
            when '3'
                quit_game()
            else
                puts "Invalid Input, please try again"
                setup_game()
        end
    end

    def start_game()
        game = Turn_controller.new()
    end

    def load_game()
        if (!File.directory?('saves'))
            puts "no saves yet\n"
            setup_game()
        elsif Dir.empty?('saves')
            puts "There are no saves yet!\n"
            setup_game()
        else
            saves = Dir.open("../chess/saves")
            puts "\n\nHere are the save files please select one:"
            puts "=========================================="
            count = 1
            filelist = []
            saves.each do |file|
                if(file.include? ".json" )
                    file = file.delete_suffix('.json')
                    filelist.push(file)
                    puts "\t#{count}) #{file}"
                    count += 1
                end
            end

            input = String.new()
            while((!filelist.include?(input)))
                puts "enter filename"
                input = gets.chomp.downcase
            end

            file = File.open("../chess/saves/#{input}.json")
            game = Controller.from_json(file)
        end
      
    end
    
    def quit_game()
        puts "Thank You For Playing! <3"
        exit(0)
    end
end

a = Menu.new()