class CreatePurpleBricksProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :purple_bricks_properties do |t|
      t.string :purple_bricks_id

      t.string :address
      t.string :city
      t.string :postal_code
      t.string :type

      t.string :photo_url
      t.string :listing_url

      t.float :list_price
      t.jsonb :price_history, null: false, default: {}
      
      t.boolean :is_rental
      t.boolean :is_builder
      t.boolean :is_new
      t.boolean :is_sold

      t.st_point :location, geographic: true

      t.timestamps
    end
  end
end
