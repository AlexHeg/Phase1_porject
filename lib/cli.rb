class CLI 
   def start
    puts "Welcome to the collection of 3D MMORPG fantasy games played on your browser!
    Whats your name?" 
    API.get_data
    input = user_input
    greet(input)
   end


   def user_input
    gets.strip
   end

   def greet(name)
    puts "Greetings #{name}! Ready to find your new favorite game? Enter yes to see the list or enter exit to exit."
    menu
   end

   def menu
    selection = user_input
        if selection == "yes"
         print_games
            menu
        elsif selection == "exit"
            goodbye
        else 
            invalide
            menu
        end
    end

    def goodbye
        puts "Thanks for stopping by! If you found a game have fun playing!"
    end

    def invalide
        puts "Sorry thats not recognized... Try again"
    end

    def print_games
        
        Games.all.each.with_index(1) do |game, index|
        puts "#{index}, #{game.title}"
        end
        select_game
    end
    
    def select_game
        puts "Please enter the name of the game you like to learn more about. Remeber the names are case sensative!"
        selection = user_input
        if game = Games.find_by_selection(selection)
            game = Games.find_by_selection(selection)
        else 
            game = selection
        end
        game_detailes(game)
    end

    def game_detailes(game)
        if game == "exit"
            goodbye
        elsif game.class == Games
                puts "~~~~~~~~~~~~~~~~~"
                puts "Title: #{game.title}"
                puts "Publisher: #{game.publisher}"
                puts "Description: #{game.short_description}"
                puts "Release Date: #{game.release_date}"
                puts "~~~~~~~~~~~~~~~~~"
                puts "Enter yes to see more games or exit to exit."
        else
            invalide
        end
    end
end
