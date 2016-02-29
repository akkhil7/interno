# == Schema Information
#
# Table name: internships
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  position   :string
#  stipend    :integer
#  duration   :string
#

class InternshipsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  before_action :authenticate_company

  def index
    @interns = Internship.all
    render json: @interns, status: 200
  end

  def company_internships
    @created = current_company.internships
    render json: @created, status: 200
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

  def find_internizes
    @internship = Internship.find(params[:id])
    @internizes = Internize.where(:internship_id => @internship.id)
    render json: {internizes: @internizes}, status: 200
  end


  private
    def intern_params
      params.require(:internship).permit(:position, :created_by_id, :stipend, :duration)
    end

end
