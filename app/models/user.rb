# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  username               :string
#  email                  :string
#  first_name             :string
#  last_name              :string
#  access_token           :string
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  resume_id              :string
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :validatable

  #Token Auth
  before_create :update_access_token!
  require 'securerandom'

  def update_access_token!
    return if access_token.present?
    self.access_token = SecureRandom.uuid.gsub(/\-/,'')
  end
  #End of Token Auth

  has_many :internships, through: :internize

end
