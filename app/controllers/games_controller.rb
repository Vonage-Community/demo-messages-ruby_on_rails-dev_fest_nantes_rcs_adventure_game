class GamesController < ApplicationController
  def show
    @name = session[:name]
  end

  def new
    @name = session[:name]
  end

  def create
    p 'Starting game for player: ' + session[:name]
    message = MessagesCreator.new('fr-step_zero').create_message

    Vonage.messaging.send(
      from: ENV['RCS_SENDER_ID'],
      to: ENV['MESSAGES_TO_NUMBER'],
      **message
    )
    redirect_to games_show_path
  end
end
