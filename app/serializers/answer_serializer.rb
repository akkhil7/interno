class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :question_id, :internize_id, :content, :question

  def question
    object.question.question
  end
end
