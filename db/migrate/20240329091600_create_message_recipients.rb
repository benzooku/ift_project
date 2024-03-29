class CreateMessageRecipients < ActiveRecord::Migration[7.1]
  def change
    create_table :message_recipients do |t|
      t.belongs_to :user
      t.belongs_to :group
      t.belongs_to :message
      t.boolean :is_read, default: false
      t.timestamps
    end
  end
end
