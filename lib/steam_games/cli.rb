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
    puts "Enter the name of the game for the date that game was released. May also 'exit', or enter 'games' for Steam's current 'Popular New Releases' again."
    menu_input = gets.strip.downcase
      selected_game = @games.detect { |the_game| the_game.name.downcase == menu_input }
        if selected_game
          puts "#{menu_input.split.map(&:capitalize).join(' ')} was released on #{selected_game.date_released}."
          puts "If you would like the percentage of positive reviews for this game, type 'review', or can type 'games', or 'exit'."
          review_input = gets.strip.downcase
          if review_input == "review"
            puts "Here is the information for #{selected_game.name}'s reviews: #{selected_game.review}"
          elsif review_input == "games"
            list_games
          else 
            if review_input == "exit"
              goodbye 
              exit
            end
            puts "Sorry, I'm not sure what that means. Here are the game's again:"
        call
        end 
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