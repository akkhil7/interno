# == Schema Information
#
# Table name: answers
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  internize_id :integer
#  question_id  :integer
#  content      :text
#

class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :internize
end
