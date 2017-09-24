class AddSnippetToPosts < ActiveRecord::Migration[4.2]
  def change
    add_column :posts, :snippet, :text
  end
end
