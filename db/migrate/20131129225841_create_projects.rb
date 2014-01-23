class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :behance_id
      t.string :name
      t.text :description
      t.integer :published_on
      t.integer :created_on
      t.integer :modified_on
      t.string :url
      t.string :privacy
      t.float :for_sale

      t.timestamps
    end

    add_index :projects, :behance_id
  end
end
