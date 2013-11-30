class CreateProjectStats < ActiveRecord::Migration
  def change
    create_table :project_stats do |t|
      t.integer :project_id
      t.integer :appreciation
      t.integer :comments

      t.timestamps
    end
  end
end
