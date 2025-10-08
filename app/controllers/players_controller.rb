class PlayersController < ApplicationController
  def new
  end

  def create
    session[:name] = params[:name]
    redirect_to new_game_path
  end
end
