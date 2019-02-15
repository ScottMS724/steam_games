class SteamGames::CLI 
  
  def call 
    puts "Hello. What is the maximum amount of money you would like to spend, (only the number is required)?"
    max_price = gets.chomp 
    list_games
  end 
  
  def list_games
    #lists all the video games at or below the user-inputted price on the first page of the current "popular new releases" from Steam's website
    puts "Games at appropriate price go here."
  end 
  
end 