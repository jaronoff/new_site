class CreateProjectOwners < ActiveRecord::Migration
  def change
    create_table :project_owners do |t|
      t.integer :behance_id
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :city
      t.string :state
      t.string :country
      t.string :company
      t.string :url

      t.timestamps
    end
  end
end
