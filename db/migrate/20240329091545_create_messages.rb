class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.text :content, null: false
      t.belongs_to :user
      t.boolean :is_ping, default: false
      t.timestamps
    end
  end
end
