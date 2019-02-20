class SteamGames::Game 
  attr_accessor :name, :review, :url 
  
  def self.popular_new_releases
    
    def initialize(name, review, url)
      @name = name 
      @review = review 
      @url = url 
    end 
    
    # Should return a list of the games on the first page of the 'Popular New Releases' on Steam's website as a collection of instances of the Game class.
    
    game_1 = self.new("Skyrim", "96% positive out of 820 reviews.", "steam.com/skyrim/popularnewreleases")
    game_2 = self.new("Overwatch", "98% positive out of 1,162 reviews.", "steam.com/overwatch/popularnewreleases")
    
    [game_1, game_2]
    
    
  end 
  
  
end 