class CreateProjectCovers < ActiveRecord::Migration
  def change
    create_table :project_covers do |t|
      t.string :url
      t.integer :project_id

      t.timestamps
    end
  end
end
