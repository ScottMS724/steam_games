class SteamGames::Game 
  attr_accessor :name, :review, :url 
  
   def initialize(name, review, url)
      @name = name 
      @review = review 
      @url = url 
   end 
  
   def self.popular_new_releases
     self.scrape_games
  
   # game_1 = self.new("Skyrim", "96% positive out of 820 reviews.", "steam.com/skyrim/popularnewreleases")
   # game_2 = self.new("Overwatch", "98% positive out of 1,162 reviews.", "steam.com/overwatch/popularnewreleases")
    
   # [game_1, game_2]
   end
    
   def self.scrape_games
     #Scrape the first page of the 'Popular New Releases' from Steam's website. Store these games as instances of the Game class in the 'games' array.
    games = []
      
    doc = Nokogiri::HTML(open("https://store.steampowered.com/search/?sort_by=Released_DESC&os=win&filter=popularnew"))
    
    #Must obtain the name of each game. Can be done by extracting the inner text from each hyperlink under the ID of "search results container."
    
    game_name = doc.search("#search_result_container span.title").text 
    binding.pry 
    
    #Must obtain the % of positive reviews for each game. Can be done by extracting the inner text of the 'span' under the class 'col search_reviewscore responsive_secondrow' under each game's respective hyperlink.
    game_review = doc.search()
      
    games
   end 
  
  
end 