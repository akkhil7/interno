class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user
  end

  def current_company
    @current_company
  end

  protected

  def auth_both
    if(params[:sender_type]=="Company")
      authenticate_company
    else
      authenticate
    end
  end

  def authenticate_both

    authenticate_or_request_with_http_token do |token, options|
      @current_user ||=User.find_by(access_token: token)
    end

    if(!@current_user.nil?)
      return true
    end
    authenticate_or_request_with_http_token do |token, options|
      @current_company ||=Company.find_by(access_token: token)
    end

    logger.debug(@current_user.inspect)

  end

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      @current_user ||=User.find_by(access_token: token)
    end
  end

  def authenticate_company
    authenticate_or_request_with_http_token do |token, options|
      @current_company ||=Company.find_by(access_token: token)
    end
  end



end

