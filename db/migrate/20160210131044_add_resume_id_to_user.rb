class AddResumeIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :resume_id, :string
  end
end
