class API 
    def self.get_data(input)
    response = RestClient.get('https://www.freetogame.com/api/games?category=#{input}')
    game_list = JSON.parse(response)
    game_list.each do |category|
        Category.new(category)
    end
    #binding.pry
end
end