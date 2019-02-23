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
    @games = SteamGames::Game.popular_new_releases
    while menu_input != "exit"
    puts "Enter the name of the game for the percentage of positive reviews that game has received. May also 'exit', or enter 'games' for Steam's current 'Popular New Releases' again."
    menu_input = gets.strip.downcase
    
    #if menu_input == "games"
      #list_games
    #elsif menu_input == "exit"
      #goodbye
      #exit 
    #else 
      #puts "#{menu_input.capitalize} has ." #search through @games hash to find the game instance that has menu_input.name and call .review on that game instance 
    #end 
    
      #case menu_input
      #when 
      
      #if @games.detect { |the_game| the_game.name.downcase == menu_input }
       # puts "#{menu_input.capitalize} has #{the_game.review}"
      if menu_input.to_i > 0 
        menu_input = menu_input.to_i
        the_game = @games[menu_input - 1]
        puts "#{the_game.name} has #{the_game.review}"
      elsif menu_input == "games" 
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