class InternizeSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :internship_id, :created_at, :condition, :internship, :user
  has_many :answers

  class AnswerSerializer < ActiveModel::Serializer
    attributes :id, :question_id, :internize_id, :content, :question
  end
end
