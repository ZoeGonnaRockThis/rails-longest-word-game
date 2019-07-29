class GamesController < ApplicationController
  def new
    @letters = [*('A'..'Z')].sample(10).join
  end


  def score
    @word = params[:word]
    @letters = params[:letters]
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    response = RestClient.get(url)
    @words = JSON.parse(response)



    # raise "Some stuff"
    if @words.include?(@word)
      @result = "Congratulations! #{@word} is a valid English word!"
    elsif @letters.include?(@word)
      @result = "Sorry, but TEST cannot be built out of #{@letter.split(",")}"
    else
      @result = "Sorry but #{@word} does not seem to be a valid English word..."
    end
  end

end
