class ChangeDurationInInternships < ActiveRecord::Migration
  def change
    change_column :internships, :duration, :integer
  end
end
