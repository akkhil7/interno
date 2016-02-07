class AddDescriptionToInternship < ActiveRecord::Migration
  def change
    add_column :internships, :description, :string
  end
end
