class InternizesController < ApplicationController
  skip_before_filter :verify_authenticity_token


  require 'boxview.rb'

  before_action :authenticate, except: [:show, :all_applications]

  before_action :authenticate_company, only: [:show, :all_applications]

  def index
    @applied = current_user.internships
    render json: @applied, status: 200
  end

  def show
    @internize = Internize.find(params[:id])
    render json: @internize, status: 200
  end

  def all_applications
    @internships = current_company.internships
    @internizes = Array.new
    @internships.each do |internship|
      application = internship.internizes
      @internizes.push(application)
    end
    render json: @internizes, status: 200
  end

  def create
    @internize = Internize.new(internize_params)
    internship = Internship.find(@internize.internship_id)
    @company = Company.find(internship.created_by.id)
    @conversation = Conversation.new(:user_id => current_user.id,:company_id => @company.id )
    if @internize.save
      if @conversation.save
        render json: @internize, status: 200
      else
        render json: @conversation.errors, status:422
      end
    else
      render json: @internize.errors, status: 422
    end
  end

  def upload_resume
    @resume = params[:resume]
    BoxView.api_key = "smx1yysqp14gk4f9qvh9j5hudrpqt3of"

    user = User.find(params[:user_id])
    @path = @resume.tempfile.path

    @response = BoxView::Document.multipart(filepath: @path)

    @session = BoxView::Session.create(document_id: @response.parsed_response["id"])

    res = @session.parsed_response["document"]["status"]
    if res == "done" || res == "processing"
      user.resume_id = @session.parsed_response["document"]["id"]
      if user.save!
        render json: @session, status: 200
      end
    else
      logger.debug(@session)
      render json: @session, status: 422
    end

  end

  private
  def internize_params
    params.require(:internize).permit(:user_id,:internship_id)
  end

end


