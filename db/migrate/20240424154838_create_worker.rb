class CreateWorker < ActiveRecord::Migration[7.1]
  def change
    create_table :workers do |t|
      t.belongs_to :user, null: false
      t.belongs_to :project, null: false
      t.timestamps
    end
  end
end
