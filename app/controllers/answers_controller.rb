class AnswersController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create

   @answers = params[:answers]
   @ans = Answer.new
   flag = false

   @answers.each do |ans|
     answer = Answer.new
     answer.question_id = ans[:question_id]
     answer.internize_id = ans[:internize_id]
     answer.content = ans[:content]
     if answer.save
       flag = true
     else
       flag = false
     end
   end

   if flag
     @ans = Answer.where(:internize_id => params[:answers].first[:internize_id]).first
     render json: @ans, status: 200
   else
     render json: @ans.errors, status: 422
   end
  end

  private
    def answer_params
      params.require(:data).require(:answers => [])
    end

end
