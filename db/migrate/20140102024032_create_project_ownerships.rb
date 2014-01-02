class CreateProjectOwnerships < ActiveRecord::Migration
  def change
    create_table :project_ownerships do |t|
      t.integer :project_owner_id
      t.integer :project_id

      t.timestamps
    end

    add_index :project_ownerships, [:project_owner_id, :project_id]
  end
end
