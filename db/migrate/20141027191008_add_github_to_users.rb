class AddGithubToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :github, :string
  end
end
