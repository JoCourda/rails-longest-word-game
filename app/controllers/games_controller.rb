require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = []
    counter = 0
    while counter < 10
      @letters << ('A'..'Z').to_a.sample
      counter += 1
    end
    @letters
  end

  def score
    @letters = params[:letters]
    @params = params[:message]
    url = open("https://wagon-dictionary.herokuapp.com/#{@params}").read
    words = JSON.parse(url)
  end
end
