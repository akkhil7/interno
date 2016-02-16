class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :subject, :company, :user
  has_many :messages
end
