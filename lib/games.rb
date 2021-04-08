class Games 
    attr_accessor :title, :short_description, :release_date, :publisher
    @@all = []
    
    def initialize(game_hash)
        game_hash.each do |key, value|
            self.send("#{key}=", value) if self.respond_to?("#{key}=")
        end
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_selection(game_title)
        self.all.detect do |game|
            game.title.downcase == game_title.downcase
        end
    end

end
