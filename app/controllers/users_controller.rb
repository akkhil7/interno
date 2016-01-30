class UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def index
    @users = User.all
    render json: @users, status: 200
  end

  def show
    @user = User.find(params[:id])
  end

#localhost/users/1/

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: 200
    else
      render @user.error, status: 422
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def user_params
      params.require(:user).permit(:username, :password, :email, :first_name, :last_name)
    end


end
