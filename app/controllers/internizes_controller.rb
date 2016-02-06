class InternizesController < ApplicationController

  def create
    @internize = Internize.new(internize_params)
    if @internize.save
      render json: @internize, status: 200
    else
      render json: @internize.errors, status:422
    end
  end

  private
    def internize_params
      params.require(:internize).permit(:user_id,:internship_id)
    end

end
