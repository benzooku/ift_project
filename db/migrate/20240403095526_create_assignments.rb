class CreateAssignments < ActiveRecord::Migration[7.1]
  def change
    create_table :assignments do |t|
      t.belongs_to :worker, null: false
      t.belongs_to :task, null: false
      t.timestamps
    end
  end
end
