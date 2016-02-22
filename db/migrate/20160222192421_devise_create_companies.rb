class DeviseCreateCompanies < ActiveRecord::Migration
  def change

    add_index :companies, :email,                unique: true
    add_index :companies, :reset_password_token, unique: true
    # add_index :companies, :confirmation_token,   unique: true
    # add_index :companies, :unlock_token,         unique: true
  end
end
