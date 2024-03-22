class CreateRoleAssignments < ActiveRecord::Migration[7.1]
  def change
    create_table :role_assignments do |t|

      t.belongs_to :worker
      t.belongs_to :role
      t.timestamps
    end
  end
end
