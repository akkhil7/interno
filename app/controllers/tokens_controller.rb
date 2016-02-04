class TokensController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  def verify
    @user = User.find_by(username: params[:user][:username])
    @flag = @user.valid_password?(params[:user][:password])

    if @flag
      @token = @user.access_token
      render json: {token: @token}, status: 200
    end
  end

  ## Receive token from frontend app and render the current user
  #if the token is valid

  def verify_token
      @user = User.find_by(access_token: params[:token])
      if @user
        render json: @user, status: 200
      else
        render json: @user.errors, status: 422
      end
  end

end
