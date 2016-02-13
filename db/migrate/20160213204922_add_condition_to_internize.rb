class AddConditionToInternize < ActiveRecord::Migration
  def change
    add_column :internizes, :condition, :string
  end
end
