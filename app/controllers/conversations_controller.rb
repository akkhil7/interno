class ConversationsController < ApplicationController
  skip_before_filter :verify_authentication_token

  before_action :authenticate
  def index
    @conversation = current_user.conversations
    render json: @conversation, status: 200
  end
end
