class AddIsListedToPosts < ActiveRecord::Migration[4.2]
  def change
    add_column :posts, :is_listed, :boolean, default: true, null: false
  end
end
