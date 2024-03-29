class CreateGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.text :description
      t.belongs_to :project
      t.timestamps
    end
  end
end
