class AddSenderTypeToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :sender_type, :string
  end
end
