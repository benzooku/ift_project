class CreateRoles < ActiveRecord::Migration[7.1]
  def change
    create_table :roles do |t|

      t.string :name, null: false
      t.integer :rank
      t.belongs_to :project, null: false
      t.timestamps
    end
  end
end
