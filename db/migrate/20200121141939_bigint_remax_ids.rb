class BigintRemaxIds < ActiveRecord::Migration[6.0]
  def change
    change_column :remax_properties, :id, :bigint
  end
end
