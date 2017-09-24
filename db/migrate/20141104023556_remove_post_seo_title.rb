class RemovePostSeoTitle < ActiveRecord::Migration[4.2]
  def up
    remove_column :posts, :seo_title
  end

  def down
    add_column :posts, :seo_title, :string
  end
end
