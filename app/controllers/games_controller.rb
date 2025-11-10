class GamesController < ApplicationController
  def show
    @player = Player.find(params[:player_id])
    @game = Game.find(params[:id])
  end

  def new
    @player = Player.find(params[:player_id])
    @game = @player.games.new
  end

  def create
    @player = Player.find(params[:player_id])
    @game = @player.games.new
    if @game.save
      message = MessagesCreator.new("#{I18n.locale}-step_zero").create_message
      begin
        Vonage.messaging.send(
          from: ENV["RCS_SENDER_ID"],
          to: ENV["MESSAGES_TO_NUMBER"],
          **message
        )
      rescue StandardError => e
        Rails.logger.error("Failed to send message: #{e.message}")
        render "new" and return
      end
      redirect_to player_game_path(@player, @game)
    else
      render "new"
    end
  end
end
