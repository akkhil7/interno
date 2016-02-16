class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name, :username, :access_token, :conversations
end

