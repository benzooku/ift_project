class CreateTaskNotes < ActiveRecord::Migration[7.1]
  def change
    create_table :task_notes do |t|
      t.belongs_to :task, null: false
      t.belongs_to :worker, null: false
      t.text :content, null: false
      t.timestamps
    end
  end
end
