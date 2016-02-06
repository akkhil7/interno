class CreateInternizes < ActiveRecord::Migration
  def change
    create_table :internizes do |t|
      t.integer :user_id
      t.integer :internship_id

      t.timestamps null: false
    end
  end
end
