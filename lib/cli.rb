class CLI
    def start
        puts "
        _______ _______ _____   _______ ______ _______      _______ _______ _______ ______ _______ 
        |     __|    ___|     |_|    ___|      |_     _|    |     __|_     _|   _   |   __ \_     _|
        |__     |    ___|       |    ___|   ---| |   |      |__     | |   | |       |      < |   |  
        |_______|_______|_______|_______|______| |___|      |_______| |___| |___|___|___|__| |___|  
                                                                                                   
        ".colorize(:light_black)
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
        puts "
        _______ _______ _______ _______      _______ ___ ___ _______ ______     
        |     __|   _   |   |   |    ___|    |       |   |   |    ___|   __ \    
        |    |  |       |       |    ___|    |   -   |   |   |    ___|      <    
        |_______|___|___|__|_|__|_______|    |_______|\_____/|_______|___|__|    
                                                                                
        ".colorize(:light_black)
        puts "Thanks for stopping by! If you found a game have fun playing!".colorize(:cyan)
    end

    def invalid
        puts "
        _______ ______ ______ _______ ______      _____  ______ _____  
        |    ___|   __ \   __ \       |   __ \    |  |  ||      |  |  | 
        |    ___|      <      <   -   |      <    |__    |  --  |__    |
        |_______|___|__|___|__|_______|___|__|       |__||______|  |__| 
                                                                        
        ".colorize(:light_black)
        puts "Sorry thats not recognized... Type yes to see the list of games or exit to exit.".colorize(:cyan)
        menu
    end

    def print_games
        
        Games.all.each.with_index(1) do |game, index|
        puts  "#{index}. #{game.title}".colorize(:light_green)
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
        #menu
    end

    def game_detailes(game)
        if game == "exit"
            goodbye
        elsif game.class == Games
            puts "~~~~~~~~~~~~~~~~~".colorize(:light_green)
            puts "~~~~~~~~~~~~~~~~~".colorize(:light_green)
            puts "Title: #{game.title}".colorize(:light_green)
            puts "Platform: #{game.platform}".colorize(:light_green)
            puts "Publisher: #{game.publisher}".colorize(:light_green)
            puts "Developer: #{game.developer}".colorize(:light_green)
            puts "Description: #{game.short_description}".colorize(:light_green)
            puts "Release Date: #{game.release_date}".colorize(:light_green)
            puts "Thumbnail: #{game.thumbnail}".colorize(:light_green)
            puts "Game URL: #{game.game_url}".colorize(:light_green)
            puts "~~~~~~~~~~~~~~~~~".colorize(:light_green)
            puts "~~~~~~~~~~~~~~~~~".colorize(:light_green)
            puts "Enter yes to see more games or exit to exit.".colorize(:cyan)
                menu
        else
            invalid
        end
    end
end
