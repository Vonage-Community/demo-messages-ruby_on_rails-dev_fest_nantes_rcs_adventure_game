class PlayersController < ApplicationController
  def new
  end

  def create
    session[:name] = params[:name]
    redirect_to games_new_path
  end
end
