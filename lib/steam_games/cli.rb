class SteamGames::CLI 
  
  def call 
    list_games
    menu
  end 
  
  def list_games
    puts "Hello. These are the current 'Popular New Releases' on Steam's website:"
    puts "List of the games is returned."
  end 
  
  def menu
    menu_input = nil 
    while menu_input != "exit"
    puts "Enter the name of the game for the percentage of positive reviews that game has received. May also 'exit', or enter 'games' for Steam's current 'Popular New Releases' again."
    menu_input = gets.strip
      case menu_input
      when "Game name"
        puts "Percentage of positive reviews for this game is returned."
      when "games" 
        list_games
      when "exit"
        exit 
      else 
        puts "Sorry, I'm not sure what that means. Here are the game's again:"
        list_games
        menu 
      end 
    end
  end 
end