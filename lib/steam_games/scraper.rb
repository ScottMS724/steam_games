class SteamGames::Scraper 
  
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
#    counter += 1 
#      
#  end 
  
 # def self.retrieve_page 
 #   Nokogiri::HTML(open("https://store.steampowered.com/search/?sort_by=Released_DESC&os=win&filter=popularnew"))
 #  end 
  
  def self.create_game_objects
    counter = 0 
    
    doc = Nokogiri::HTML(open("https://store.steampowered.com/search/?sort_by=Released_DESC&os=win&filter=popularnew"))
    all_games = doc.search("div.responsive_search_name_combined")
    all_games.each do |game|
      name = game.search("span.title").text 
      date_released = game.search("div.col.search_released.responsive_secondrow").text 
        specific_game_url = doc.css("div#search_result_container a.search_result_row")[counter].attr("href")
        specific_game_url_parse = Nokogiri::HTML(open(specific_game_url))
      review = specific_game_url_parse.search("div.user_reviews_summary_row").text.strip 
      game = SteamGames::Game.new(name, date_released, review)
      
    counter += 1 
    end 
  end 
  
end 