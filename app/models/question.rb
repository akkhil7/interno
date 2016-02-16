# == Schema Information
#
# Table name: questions
#
#  id            :integer          not null, primary key
#  internship_id :integer
#  question      :string
#  answer        :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Question < ActiveRecord::Base
  belongs_to :internship
  has_many :answers
end
