class AddCreatedByToInternship < ActiveRecord::Migration
  def change
    add_column :internships, :created_by_id, :integer
  end
end
