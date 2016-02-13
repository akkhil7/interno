class InternshipSerializer < ActiveModel::Serializer
  attributes :id, :position, :duration, :location, :description,
              :created_by
  has_many :internizes
end
