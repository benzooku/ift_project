class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      ## Information
      t.string :name, null: false, default: ''

      t.timestamps null: false
    end

    # add_index :users, :unlock_token,         unique: true
    create_table :workers do |t|
      t.belongs_to :user
      t.belongs_to :project
      t.timestamps
    end
  end
end
