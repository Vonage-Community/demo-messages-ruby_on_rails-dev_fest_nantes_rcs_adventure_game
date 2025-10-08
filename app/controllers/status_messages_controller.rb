class StatusMessagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def create
    p 'Status message received: ' + params.to_unsafe_h.to_s
    head :ok
  end
end
