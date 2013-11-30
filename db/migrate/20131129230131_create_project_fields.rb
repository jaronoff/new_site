class CreateProjectFields < ActiveRecord::Migration
  def change
    create_table :project_fields do |t|
      t.integer :field_id
      t.integer :project_id

      t.timestamps
    end
  end
end
