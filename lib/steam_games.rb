require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative "./steam_games/version"
require_relative './steam_games/cli'
require_relative './steam_games/game'

module SteamGames
  class Error < StandardError; end
  # Your code goes here...
end
