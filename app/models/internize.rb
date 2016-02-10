# == Schema Information
#
# Table name: internizes
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  internship_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

#1  1   1
#2  1   2
class Internize < ActiveRecord::Base
  belongs_to :users
  belongs_to :internships
end
