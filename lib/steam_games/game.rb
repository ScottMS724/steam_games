class SteamGames::Game 
  attr_accessor :name, :date_released, :review, :url 
  
  def initialize(name, date_released, review)
    @name = name
    @date_released = date_released 
    @review = review 
  end 
  
   def self.popular_new_releases
     self.scrape_games
   end
    
   def self.scrape_games
    counter = 0 
    
    games_hash = []
      
    doc = Nokogiri::HTML(open("https://store.steampowered.com/search/?sort_by=Released_DESC&os=win&filter=popularnew"))
    all_games = doc.search("div.responsive_search_name_combined")
    all_games.each do |game|
      name = game.search("span.title").text 
      date_released = game.search("div.col.search_released.responsive_secondrow").text 
        specific_game_url = doc.css("div#search_result_container a.search_result_row")[counter].attr("href")
        specific_game_url_parse = Nokogiri::HTML(open(specific_game_url))
      review = specific_game_url_parse.search("div.user_reviews_summary_row").text.strip 
      game = self.new(name, date_released, review)
      games_hash << game 
      
      counter += 1 
      
    end 
    games_hash
   end 
  
end 