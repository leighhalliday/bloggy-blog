class RemoveNotNullOnPostsTitle < ActiveRecord::Migration[4.2]
  def up
    change_column :posts, :title, :string, null: true
    change_column :posts, :body, :text, null: true
  end

  def down
    change_column :posts, :title, :string, null: false
    change_column :posts, :body, :text, null: false
  end
end
