class RenameColumnTypeFromLocationToCategory < ActiveRecord::Migration[7.1]
  def change
    rename_column :locations, :type, :category
  end
end
