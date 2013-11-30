class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.string :name

      t.timestamps
    end

    add_index :fields, :name
  end
end
