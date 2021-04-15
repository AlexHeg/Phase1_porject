class API 
    def self.get_data
    response = RestClient.get('https://www.freetogame.com/api/games?tag=fantasy&category=mmorpg')
    game_list = JSON.parse(response)
    game_list.each do |game|
        Games.new(game)
    end
    #binding.pry
end
end