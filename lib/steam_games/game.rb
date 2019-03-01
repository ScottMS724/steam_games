class SteamGames::Game 
  attr_accessor :name, :date_released, :url 
  
  def initialize(name, date_released)
    @name = name
    @date_released = date_released 
  end 
  
   def self.popular_new_releases
     self.scrape_games
  
   # game_1 = self.new("Skyrim", "96% positive out of 820 reviews.", "steam.com/skyrim/popularnewreleases")
   # game_2 = self.new("Overwatch", "98% positive out of 1,162 reviews.", "steam.com/overwatch/popularnewreleases")
    
   # [game_1, game_2]
   end
    
   def self.scrape_games
     #Scrape the first page of the 'Popular New Releases' from Steam's website. Store these games as instances of the Game class in the 'games' array.
    games_hash = []
      
    doc = Nokogiri::HTML(open("https://store.steampowered.com/search/?sort_by=Released_DESC&os=win&filter=popularnew"))
    games = doc.search("div.responsive_search_name_combined")
    games.each do |game|
      name = game.search("span.title").text 
      date_released = game.search("div.col.search_released.responsive_secondrow").text 
      game = self.new(name, date_released)
      games_hash << game 
      binding.pry
    end 
    
    
    
    #Must obtain the element that contains all of the data for each game on Steam's website, make each game its own object, and assign the data to its approrpiate game object.
    
    games_hash
   end 
  
end 