class CompaniesController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def index
    @companies = Company.all
    render json: @companies, status: 200
  end

  def create
    @company = Company.new(company_params)

    if @company.save
      render json: @company, status: 200
    else
      render @company.errors, status: 422
    end
  end

  private
    def company_params
      params.require(:company).permit(:username, :company_url, :password, :name, :email)
    end
end
