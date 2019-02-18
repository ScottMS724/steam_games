class SteamGames::Game 
  attr_accessor :name, :review, :url 
  
  def self.popular_new_releases
    
    # Should return a list of the games on the first page of the 'Popular New Releases' on Steam's website as a collection of instances of the Game class.
    
    game_1 = self.new 
    game_1.name = "Skyrim"
    game_1.review = "96% positive out of 820 reviews."
    game_1.url = "steam.com/skyrim/popularnewreleases"
    
    game_2 = self.new 
    game_2.name = "Overwatch"
    game_2.review = "98% positive out of 1,162 reviews."
    game_2.url = "steam.com/overwatch/popularnewreleases"
    
    [game_1, game_2]
    
    
  end 
  
  
end 