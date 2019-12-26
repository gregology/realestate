class RenameProperty < ActiveRecord::Migration[6.0]
  def change
    rename_table :properties, :zolo_properties
  end
end
