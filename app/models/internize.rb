# == Schema Information
#
# Table name: internizes
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  internship_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  condition     :string
#

#1  1   1
#2  1   2
class Internize < ActiveRecord::Base
  belongs_to :user
  belongs_to :internship
  has_many :answers
end
