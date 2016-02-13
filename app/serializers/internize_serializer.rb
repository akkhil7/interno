class InternizeSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :internship_id, :created_at, :condition
end
