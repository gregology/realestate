class GisExtension < ActiveRecord::Migration[6.0]
  def up
    execute "CREATE EXTENSION IF NOT EXISTS POSTGIS;"  
  end

  def down
    execute "DROP EXTENSION IF EXISTS POSTGIS;"
  end
end
