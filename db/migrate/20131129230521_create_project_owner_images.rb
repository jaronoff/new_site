class CreateProjectOwnerImages < ActiveRecord::Migration
  def change
    create_table :project_owner_images do |t|
      t.integer :project_owner_id
      t.string :url

      t.timestamps
    end
  end
end
