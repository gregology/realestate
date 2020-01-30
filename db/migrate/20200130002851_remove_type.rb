class RemoveType < ActiveRecord::Migration[6.0]
  def change
    rename_column :purple_bricks_properties, :type, :land_type
    rename_column :zolo_properties, :latest_list_price, :list_price
  end
end
