class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.text :description
      t.datetime :expected_finish_date, null: false
      t.datetime :finish_date
      t.datetime :start_date
      t.belongs_to :project, null: false
      t.timestamps
    end
  end
end
