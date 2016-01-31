class AddColumnsToInternship < ActiveRecord::Migration
  def change
    add_column :internships, :position, :string
    add_column :internships, :stipend, :integer
    add_column :internships, :duration, :string
  end
end
