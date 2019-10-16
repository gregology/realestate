class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.string :title
      t.float :latest_list_price
      t.jsonb :price_history, null: false, default: {}
      t.string :city
      t.string :address
      t.string :listing_url
      t.string :photo_url
      t.datetime :list_date
      t.st_point :location, geographic: true

      t.timestamps
    end
  end
end
