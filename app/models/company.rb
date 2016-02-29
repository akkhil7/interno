# == Schema Information
#
# Table name: companies
#
#  id                     :integer          not null, primary key
#  name                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  username               :string
#  email                  :string
#  encrypted_password     :string
#  reset_password_token   :string
#  reset_password_sent_at :string
#  company_url            :string
#  access_token           :string
#
# Indexes
#
#  index_companies_on_email                 (email) UNIQUE
#  index_companies_on_reset_password_token  (reset_password_token) UNIQUE
#

class Company < ActiveRecord::Base
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

  has_many :internships, foreign_key: :created_by_id
  has_many :conversations
  has_many :messages, as: :sender

end
