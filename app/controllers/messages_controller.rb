class MessagesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :auth_both

  def index
    @messages = current_user.messages
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      render json: @message, status: 200
    else
      render json: @message.errors, status: 422
    end
  end

  private
    def message_params
      params.require(:message).permit(:sender_id,:sender_type,:conversation_id,:content)
    end
end


