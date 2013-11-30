class CreateProjectOwnerFields < ActiveRecord::Migration
  def change
    create_table :project_owner_fields do |t|
      t.integer :project_owner_id

      t.integer :field_id

      t.timestamps
    end

    add_index :project_owner_fields, [:project_owner_id, :field_id]
  end
end
