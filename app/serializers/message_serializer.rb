class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :sender, :conversation, :created_at
end
