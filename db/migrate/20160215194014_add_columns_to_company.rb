class AddColumnsToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :username, :string
    add_column :companies, :email, :string
    add_column :companies, :encrypted_password, :string
    add_column :companies, :reset_password_token, :string
    add_column :companies, :reset_password_sent_at, :string
  end
end
