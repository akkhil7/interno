class AddProfileToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile_id, :integerprofile_type
  end
end
