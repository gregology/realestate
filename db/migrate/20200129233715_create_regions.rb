class CreateRegions < ActiveRecord::Migration[6.0]
  def change
    create_table :regions do |t|
      t.string :title
      t.st_polygon :area, geographic: true

      t.timestamps
    end
  end
end
