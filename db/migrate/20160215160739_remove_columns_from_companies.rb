class RemoveColumnsFromCompanies < ActiveRecord::Migration
  def change
    remove_column :companies, :username, :string
    remove_column :companies, :email, :string
    remove_column :companies, :encrypted_password, :string
    remove_column :companies, :reset_password_token, :string
    remove_column :companies, :reset_password_sent_at, :string
  end
end
