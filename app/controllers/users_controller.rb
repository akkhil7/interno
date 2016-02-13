# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  username               :string
#  email                  :string
#  first_name             :string
#  last_name              :string
#  access_token           :string
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#

class UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token
  require 'boxview.rb'

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

  def check_resume
    BoxView.api_key = "smx1yysqp14gk4f9qvh9j5hudrpqt3of"
    @user = User.find(params[:id])

    if @user.resume_id.nil?
      render json: {has_resume: false}, status: 204
    elsif !@user.resume_id.nil?
      response = BoxView::Document.show document_id: @user.resume_id
      @session = BoxView::Session.create(document_id: @user.resume_id)
      res = @session.parsed_response["document"]["status"]
      render json: @session, status: 200
    else
      render status: 422
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :password, :email, :first_name, :last_name)
    end


end
