# == Schema Information
#
# Table name: conversations
#
#  id         :integer          not null, primary key
#  subject    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  company_id :integer
#

class Conversation < ActiveRecord::Base
  has_many :messages
  has_many :involvements
  belongs_to :user
  belongs_to :company
end
