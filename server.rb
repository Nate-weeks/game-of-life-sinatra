require './models/Board.rb'


require 'sinatra'
require "pry"
require "sinatra/reloader" if development?


set :bind, '0.0.0.0'
$board = Board.new

get "/" do
    gameboard = $board
    gameboard.toggleTile(50,50)
    gameboard.toggleTile(50,51)
    gameboard.toggleTile(50,52)
    @grid = gameboard.grid
    erb :home
end

post "/" do
  gameboard = $board
  if params[:step] == "step"
    gameboard.stepForward
  end
  @grid = gameboard.grid
  erb :home
end
