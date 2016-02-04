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
#

class Internship < ActiveRecord::Base
end
