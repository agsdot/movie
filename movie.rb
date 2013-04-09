require 'pry'
require 'better_errors'
gem 'sinatra', '1.3.0'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

require 'open-uri'
require 'json'
require 'uri'

get '/' do 
  if !params[:title].nil?
    @title = params[:title] 
    url = "http://www.omdbapi.com/?s=#{URI.escape(@title)}"
    file = open(url)
    @results = JSON.load(file.read)
    @results = @results['Search']

      # if @results['Error']
      #   return "Sorry, there was an error: #{@result['Error']}"
      # end
  end
erb :home
end

get '/movie-page/:imdbID' do
  if !params[:imdbID].nil?
    imdbID = params[:imdbID] 
    url = "http://www.omdbapi.com/?i=#{URI.escape(imdbID)}"
    file = open(url)
    @results = JSON.load(file.read)
    # @results = @results['Search']
end
erb :movie_page
end

