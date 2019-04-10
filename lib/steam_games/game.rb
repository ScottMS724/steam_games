class SteamGames::Game 
  attr_accessor :name, :date_released, :review, :url 
  
  @@all = [] 
  
  def initialize(name, date_released, review)
    @name = name
    @date_released = date_released 
    @review = review 
    @@all << self 
  end 
  
  def self.all 
    @@all 
  end 
  
  
  
  #def self.popular_new_releases
  #  self.scrape_games
  #end
    
#  def self.scrape_games
#    counter = 0 
#    
#    doc = Nokogiri::HTML(open("https://store.steampowered.com/search/?sort_by=Released_DESC&os=win&filter=popularnew"))
#    all_games = doc.search("div.responsive_search_name_combined")
#    all_games.each do |game|
#      name = game.search("span.title").text 
#      date_released = game.search("div.col.search_released.responsive_secondrow").text 
#        specific_game_url = doc.css("div#search_result_container a.search_result_row")[counter].attr("href")
#        specific_game_url_parse = Nokogiri::HTML(open(specific_game_url))
#      review = specific_game_url_parse.search("div.user_reviews_summary_row").text.strip 
#      game = self.new(name, date_released, review)
#      
#      counter += 1 
#      
#    end 
#  end 
  
  def self.find_by_name(name)
    SteamGames::Game.all.detect { |the_game| the_game.name.downcase == name.downcase } 
  end 
  
end 