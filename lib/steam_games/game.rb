class SteamGames::Game 
  attr_accessor :name, :date_released, :url 
  
  def initialize(name, date_released)
    @name = name
    @date_released = date_released 
  end 
  
   def self.popular_new_releases
     self.scrape_games
   end
    
   def self.scrape_games
    games_hash = []
      
    doc = Nokogiri::HTML(open("https://store.steampowered.com/search/?sort_by=Released_DESC&os=win&filter=popularnew"))
    all_games = doc.search("div.responsive_search_name_combined")
    all_games.each do |game|
      name = game.search("span.title").text 
      date_released = game.search("div.col.search_released.responsive_secondrow").text 
      game = self.new(name, date_released)
      games_hash << game 
      
    end 
    games_hash
   end 
  
end 