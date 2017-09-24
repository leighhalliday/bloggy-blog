class AddDataTypeToSettings < ActiveRecord::Migration[4.2]
  def change
    add_column :settings, :data_type, :string, default: "string"
  end
end
