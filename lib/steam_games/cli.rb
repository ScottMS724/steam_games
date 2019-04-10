class SteamGames::CLI 
  
  def call 
    scraping_games
    list_games
    menu
  end 
  
  def scraping_games 
    puts "Hello! Please wait while the most recent 'Popular New Releases' are retrieved from Steam's website."
    SteamGames::Scraper.create_game_objects  
  end 
  
  def list_games
    puts "These are the current 'Popular New Releases' on Steam's website:"
    SteamGames::Game.all.each.with_index(1) do |game, i|
      puts "#{i}. #{game.name}"
    end 
  end 
  
  def menu
    menu_input = nil 
    while menu_input != "exit"
    puts "Enter the name of the game for the date that game was released. May also 'exit', or enter 'games' for Steam's current 'Popular New Releases' again."
    menu_input = gets.strip.downcase
      #selected_game = SteamGames::Game.all.detect { |the_game| the_game.name.downcase == menu_input }
      selected_game = SteamGames::Game.find_by_name(menu_input)
        if selected_game
          puts "#{menu_input.split.map(&:capitalize).join(' ')} was released on #{selected_game.date_released}."
          puts "If you would like the review information for this game, type 'review', or you can type 'games' for the list of games again, or 'exit'."
          review_input = gets.strip.downcase
          if review_input == "review"
            puts "Here is the review information for #{selected_game.name}: #{selected_game.review.gsub(/\s+/, ' ').strip}"
          elsif review_input == "games"
            list_games
          else 
            if review_input == "exit"
              goodbye 
              exit
            end
            puts "Sorry, I'm not sure what that means. Here are the game's again:"
        list_games 
        end 
      elsif menu_input == "games" 
          list_games
      else 
        if menu_input == "exit"
          goodbye
          exit
        end 
        puts "Sorry, I'm not sure what that means. Here are the game's again:"
      list_games 
      end 
    end
  end 
  
  def goodbye
    puts "Goodbye! See you soon."
  end 
  
end