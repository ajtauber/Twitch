class Twitch < ApplicationRecord
  include HTTParty
  # base_uri 'http://swapi.co/api/people'
  #
  # def self.generate
  #   random_number = rand(90)
  #   response = get("/#{random_number}")
  #
  #   puts response["name"]
  # end
end
