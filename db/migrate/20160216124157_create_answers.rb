class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|

      t.timestamps null: false
    end
    add_column :answers, :internize_id, :integer
    add_column :answers, :question_id, :integer
  end
end
