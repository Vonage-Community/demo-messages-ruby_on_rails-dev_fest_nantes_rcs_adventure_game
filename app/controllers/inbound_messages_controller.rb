class InboundMessagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    reply_id = params[:reply][:id].to_s
    message = MessagesCreator.new(reply_id).create_message

    Vonage.messaging.send(
      from: ENV["RCS_SENDER_ID"],
      to: ENV["MESSAGES_TO_NUMBER"],
      **message
    )
    head :ok
  end
end
