class SteamGames::CLI 
  
  def call 
    list_games
    menu
  end 
  
  def list_games
    puts "Hello. These are the current 'Popular New Releases' on Steam's website:"
    @games = SteamGames::Game.popular_new_releases
    @games.each.with_index(1) do |game, i|
      puts "#{i}. #{game.name}"
    end 
  end 
  
  def menu
    menu_input = nil 
    while menu_input != "exit"
    puts "Enter the name of the game for the percentage of positive reviews that game has received. May also 'exit', or enter 'games' for Steam's current 'Popular New Releases' again."
    menu_input = gets.strip
    
      case menu_input
      when "Game name"
        puts "Percentage of positive reviews for this game is returned."
        puts "[Game name here] has #{@games[0].review}"
      when "games" 
        list_games
      else 
        if menu_input == "exit"
          goodbye
          exit
        end 
        puts "Sorry, I'm not sure what that means. Here are the game's again:"
        call
      end 
    end
  end 
  
  def goodbye
    puts "Goodbye! See you soon."
  end 
end