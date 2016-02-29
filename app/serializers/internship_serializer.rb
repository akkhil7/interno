class InternshipSerializer < ActiveModel::Serializer
  attributes :id, :position, :stipend, :duration, :location, :description,
              :created_by
  has_many :internizes
  has_many :questions
  has_many :users
end
