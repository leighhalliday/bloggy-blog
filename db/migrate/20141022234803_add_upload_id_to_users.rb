class AddUploadIdToUsers < ActiveRecord::Migration[4.2]
  def change
    add_column :users, :upload_id, :integer
  end
end
