class AddDescriptionToSettings < ActiveRecord::Migration[4.2]
  def change
    add_column :settings, :description, :text
  end
end
