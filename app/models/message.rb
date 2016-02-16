# == Schema Information
#
# Table name: messages
#
#  id              :integer          not null, primary key
#  conversation_id :integer
#  sender_id       :integer
#  content         :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  sender_type     :string
#

class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :sender, polymorphic: true
end
