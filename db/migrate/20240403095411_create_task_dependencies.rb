class CreateTaskDependencies < ActiveRecord::Migration[7.1]
  def change
    create_table :task_dependencies do |t|
      t.belongs_to :task, null: false
      t.belongs_to :base_task, foreign_key: { to_table: :tasks}, null: false
      t.boolean :required, default: false
      t.timestamps
    end
  end
end
