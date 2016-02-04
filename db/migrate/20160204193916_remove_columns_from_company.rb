class RemoveColumnsFromCompany < ActiveRecord::Migration
  def change
    remove_column(:companies, :sign_in_count)
    remove_column(:companies, :last_sign_in_at)
    remove_column(:companies, :current_sign_in_at)
    remove_column(:companies, :current_sign_in_ip)
    remove_column(:companies, :last_sign_in_ip)
    remove_column(:companies, :remember_created_at)
  end
end
