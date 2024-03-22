class CreatePermissions < ActiveRecord::Migration[7.1]
  def change
    create_table :permissions do |t|

      t.string :name, null: false
      t.text :description
      t.timestamps
    end
  end
end
