# == Schema Information
#
# Table name: internships
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  position      :string
#  stipend       :integer
#  duration      :integer
#  created_by_id :integer
#  location      :string
#  description   :string
#

class Internship < ActiveRecord::Base
  belongs_to :created_by, class_name: "Company", foreign_key: :created_by_id
  has_many :users, through: :internize
  has_many :questions
end
