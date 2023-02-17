require "open-uri"

class GamesController < ApplicationController
  def new
    @random_letters = Array.new(10) { ('a'..'z').to_a[rand(26)] }
  end

  def score
    @letters = params[:letters].split(",")
    @word = params[:query]
    url = "https://wagon-dictionary.herokuapp.com/#{params[:query]}"
    @response = JSON.parse(URI.open(url).read).values.first
  end

end
