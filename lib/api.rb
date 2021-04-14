class API 
    def self.get_data(input)
    response = RestClient.get('https://www.freetogame.com/api/games?category=mmorpg')
    game_list = JSON.parse(response)
    game_list.each do |game|
        Game.new(game)
    end
    #binding.pry
end
end