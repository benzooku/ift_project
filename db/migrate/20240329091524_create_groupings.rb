class CreateGroupings < ActiveRecord::Migration[7.1]
  def change
    create_table :groupings do |t|
      t.belongs_to :worker, null: false
      t.belongs_to :group, null: false
      t.timestamps
    end
  end
end
