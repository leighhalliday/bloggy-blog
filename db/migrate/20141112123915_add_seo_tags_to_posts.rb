class AddSeoTagsToPosts < ActiveRecord::Migration[4.2]
  def change
    add_column :posts, :seo_tags, :string
  end
end
