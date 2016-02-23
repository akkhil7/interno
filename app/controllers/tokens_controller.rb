class TokensController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  def verify
    @user = User.find_by(username: params[:user][:username])
    @flag = @user.valid_password?(params[:user][:password])

    if @flag
      @token = @user.access_token
      render json: {token: @token}, status: 200
    else
      render text: "Wrong Password", status: 422
    end
  end

  ## Receive token from frontend app and render the current user
  #if the token is valid

  def verify_token
    @user = User.find_by(access_token: params[:token])
    @company = Company.find_by(access_token: params[:token])
    if @user
      render json: @user, status: 200
    elsif @company
      render json: @company, status: 200
    else
      render text: "Cannot verify", status: 422
    end
  end

  def verify_company
    @user = User.find_by(username: params[:user][:username])
    @flag = @user.valid_password?(params[:user][:password])

    if @flag
      @token = @user.access_token
      render json: {token: @token}, status: 200
    else
      render text: "Wrong Password", status: 422
    end
  end


end
