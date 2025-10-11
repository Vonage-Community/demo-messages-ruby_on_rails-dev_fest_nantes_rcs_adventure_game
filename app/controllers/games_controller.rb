class GamesController < ApplicationController
  def show
    @name = params[:id]
  end

  def new
    @name = session[:name]
  end

  def create
    message = MessagesCreator.new("#{I18n.locale}-step_zero").create_message

    Vonage.messaging.send(
      from: ENV["RCS_SENDER_ID"],
      to: ENV["MESSAGES_TO_NUMBER"],
      **message
    )
    redirect_to game_path(session[:name])
  end
end
