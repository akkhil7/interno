class InternshipsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def index
    @interns = Internship.all
    render json: @interns, status: 200
  end

  def create
    @intern = Internship.new(intern_params)
    if @intern.save!
      render json: @intern, status: 200
    else
      render json: @intern.errors, status: 422
    end
  end

  def destroy
    @intern = Internship.find(params[:id])
    if @intern.destroy!
      render text: "Was destroyed", status: 200
    else
      render json: @intern.errors, status: 422
    end
  end
  private
    def intern_params
      params.require(:internship).permit(:position, :stipend, :duration)
    end

end
