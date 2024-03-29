class CreateGroupings < ActiveRecord::Migration[7.1]
  def change
    create_table :groupings do |t|
      t.belongs_to :worker
      t.belongs_to :group
      t.timestamps
    end
  end
end
