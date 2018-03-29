class AddLastModifiedAtToPosts < ActiveRecord::Migration[5.1]
  def up
    add_column :posts, :last_modified_at, :timestamp

    execute "
      UPDATE posts SET last_modified_at = published_at
    "
  end

  def down
    remove_column :posts, :last_modified_at
  end
end
