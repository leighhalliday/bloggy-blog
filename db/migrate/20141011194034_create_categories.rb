class CreateCategories < ActiveRecord::Migration[4.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :description
      t.integer :upload_id
      t.timestamps
    end
  end
end
