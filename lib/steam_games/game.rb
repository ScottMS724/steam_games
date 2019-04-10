class SteamGames::Game 
  attr_accessor :name, :date_released, :review, :url 
  
  @@all = [] 
  
  def initialize(name, date_released, url)
    @name = name
    @date_released = date_released 
    @url = url 
    @@all << self 
  end 
  
  def self.all 
    @@all 
  end 
  
  def review
    @review ||= SteamGames::Scraper.scrape_review(url)
  end 
  
  def self.find_by_name(name)
    SteamGames::Game.all.detect { |the_game| the_game.name.downcase == name.downcase } 
  end 
  
end 