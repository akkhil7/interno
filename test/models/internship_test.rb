# == Schema Information
#
# Table name: internships
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  position   :string
#  stipend    :integer
#  duration   :string
#

require 'test_helper'

class InternshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
