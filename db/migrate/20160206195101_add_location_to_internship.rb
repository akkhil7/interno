class AddLocationToInternship < ActiveRecord::Migration
  def change
    add_column :internships, :location, :string
  end
end
