class AddSlugToCategories < ActiveRecord::Migration[4.2]
  def change
    add_column :categories, :slug, :string, null: false
  end
end
