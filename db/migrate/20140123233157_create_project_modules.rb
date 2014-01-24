class CreateProjectModules < ActiveRecord::Migration
  def change
    create_table :project_modules do |t|
      t.integer :project_id
      t.string :content_type
      t.text :content

      t.timestamps
    end
  end
end
