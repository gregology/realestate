class CreateRemaxProperty < ActiveRecord::Migration[6.0]
  def change
    create_table :remax_properties do |t|
      t.string :address
      t.string :city
      t.string :baths
      t.string :full_baths
      t.string :half_baths
      t.string :bed
      t.string :detail_url
      t.string :mls_num
      t.string :postal_code
      t.string :primary_business_type

      t.float :list_price 
      t.float :lot_size 

      t.boolean :is_luxury
      t.boolean :is_commercial
      t.boolean :is_remax_listing

      t.datetime :list_date
      t.st_point :location, geographic: true
      t.jsonb :images, null: false, default: []

      t.timestamps
    end
  end
end
