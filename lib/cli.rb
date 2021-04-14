class CLI
    def start
    puts "Welcome! What is your name?".colorize(:cyan)
    API.get_data
    input = user_input
    greet(input)
    end
   def user_input
    gets.strip
   end

   def greet(name)
    puts "Greetings #{name}! Ready to find your new favorite MMORPG game? Enter yes to see the list or enter exit to exit.".colorize(:cyan)
    menu
   end

   def menu
    selection = user_input
        if selection.downcase == "yes"
         print_games
            #menu
        elsif selection.downcase == "exit"
            goodbye
        else 
            invalid
            menu
        end
    end

    def goodbye
        puts "Thanks for stopping by! If you found a game have fun playing!".colorize(:cyan)
    end

    def invalid
        puts "Sorry thats not recognized... Type yes to see the list of games or exit to exit.".colorize(:cyan)
    end

    def print_games
        
        Games.all.each.with_index(1) do |game, index|
        puts "#{index}. #{game.title}".colorize(:light_green)
        end
        select_game
        
    end
    
    def select_game
        puts "Please enter the name of the game you like to learn more about.".colorize(:cyan)
        selection = user_input
        if game = Games.find_by_selection(selection)
            game = Games.find_by_selection(selection)
        else 
            game = selection
        end
        game_detailes(game)
        menu
    end

    def game_detailes(game)
        if game == "exit"
            goodbye
        elsif game.class == Games
                puts "~~~~~~~~~~~~~~~~~".colorize(:light_green)
                puts "Title: #{game.title}".colorize(:light_green)
                puts "Platform: #{game.platform}".colorize(:light_green)
                puts "Publisher: #{game.publisher}".colorize(:light_green)
                puts "Developer: #{game.developer}".colorize(:light_green)
                puts "Description: #{game.short_description}".colorize(:light_green)
                puts "Release Date: #{game.release_date}".colorize(:light_green)
                puts "~~~~~~~~~~~~~~~~~".colorize(:light_green)
                puts "Enter yes to see more games or exit to exit.".colorize(:cyan)
        else
            invalid
        end
    end
end
