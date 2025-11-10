class PlayersController < ApplicationController
  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to new_player_game_path(@player)
    else
      render "new"
    end
  end

  private

  def player_params
    params.require(:player).permit(:name)
  end
end
