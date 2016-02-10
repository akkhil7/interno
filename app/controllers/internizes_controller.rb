class InternizesController < ApplicationController
  skip_before_filter :verify_authenticity_token


  require 'nestful'
  require 'boxview.rb'

  def index
    @applied = current_user.internships
    render json: @applied, status: 200
  end

  def create
    @internize = Internize.new(internize_params)
    if @internize.save
      render json: @internize, status: 200
    else
      render json: @internize.errors, status:422
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

