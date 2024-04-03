class CreateRoleAssignments < ActiveRecord::Migration[7.1]
  def change
    create_table :role_assignments do |t|

      t.belongs_to :worker, null: false
      t.belongs_to :role, null: false
      t.timestamps
    end
  end
end
