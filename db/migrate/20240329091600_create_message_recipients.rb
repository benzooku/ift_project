class CreateMessageRecipients < ActiveRecord::Migration[7.1]
  def change
    create_table :message_recipients do |t|
      t.belongs_to :user, null: false
      t.belongs_to :group, null: false
      t.belongs_to :message, null: false
      t.boolean :is_read, default: false
      t.timestamps
    end
  end
end
