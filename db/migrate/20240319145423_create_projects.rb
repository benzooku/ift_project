class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      ## Information
      t.string :name, null: false

      t.timestamps null: false
    end

    # add_index :users, :unlock_token,         unique: tru
  end
end
