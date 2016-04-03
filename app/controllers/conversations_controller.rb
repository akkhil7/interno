class ConversationsController < ApplicationController
  skip_before_filter :verify_authentication_token

  before_action :authenticate, except: [:company_conversations]
  before_action :authenticate_company, except: [:index]

  def index
    @conversation = current_user.conversations
    render json: @conversation, status: 200
  end

  def company_conversations
    @conversations = current_company.conversations
    render json: @conversations, status: 200
  end
end
