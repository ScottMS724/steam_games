class SteamGames::Scraper 
  
  def self.create_game_objects
    
    doc = Nokogiri::HTML(open("https://store.steampowered.com/search/?sort_by=Released_DESC&os=win&filter=popularnew"))
    all_games = doc.search("div.responsive_search_name_combined")
    all_games.each_with_index do |game, counter|
      name = game.search("span.title").text 
      date_released = game.search("div.col.search_released.responsive_secondrow").text 
      specific_game_url = doc.css("div#search_result_container a.search_result_row")[counter].attr("href")
      #specific_game_url_parse = Nokogiri::HTML(open(specific_game_url))
      #review = specific_game_url_parse.search("div.user_reviews_summary_row").text.strip 
      game = SteamGames::Game.new(name, date_released, specific_game_url)
      
    end 
  end 
  
  def self.scrape_review(specific_game_url)
    puts "Scraping #{specific_game_url}"
    #specific_game_url = doc.css("div#search_result_container a.search_result_row")[counter].attr("href")
    specific_game_url_parse = Nokogiri::HTML(open(specific_game_url))
    specific_game_url_parse.search("div.user_reviews_summary_row").text.strip 
  end 
  
end 

# add another class method, `self.scrape_review(url)` ... this method should only be called when we request the details of a specific game 
# you will also have to adjust your setter in your Game class for the review... 
# You might also have to adjust your initialize method in the Game class..
# In your custom setter, use memoization to prevent scraping for the same review more than once

