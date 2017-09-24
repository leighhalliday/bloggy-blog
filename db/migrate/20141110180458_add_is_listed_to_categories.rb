class AddIsListedToCategories < ActiveRecord::Migration[4.2]
  def change
    add_column :categories, :is_listed, :boolean, default: true, null: false
  end
end
