class CreatePrelistProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :prelist_properties do |t|
      t.string :address
      t.string :beds
      t.string :baths

      t.string :photo_url
      t.string :listing_url

      t.float :list_price
      t.float :lot_size

      t.jsonb :price_history, null: false, default: {}

      t.st_point :location, geographic: true

      t.timestamps
    end
  end
end
