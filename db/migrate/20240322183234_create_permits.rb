class CreatePermits < ActiveRecord::Migration[7.1]
  def change
    create_table :permits do |t|

      t.belongs_to :permission, null: false
      t.belongs_to :role, null: false
      t.timestamps
    end
  end
end
