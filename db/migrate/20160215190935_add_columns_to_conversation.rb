class AddColumnsToConversation < ActiveRecord::Migration
  def change
    add_column :conversations, :user_id, :integer
    add_column :conversations, :company_id, :integer
  end
end
