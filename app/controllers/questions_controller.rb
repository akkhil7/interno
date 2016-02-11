class QuestionsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  before_action :authenticate

  def update
    @payload = params[:questions]
    flag = false
    @payload.each do |item|
      logger.debug(item)
      @question = Question.find(item["id"])
      @question.answer = item["answer"]
      if @question.save!
        flag = true
      else
        flag = false
      end
    end

    if flag
      render json: @payload, status: 200
    else
      render json: @payload.errors, status: 422
    end

  end

end
