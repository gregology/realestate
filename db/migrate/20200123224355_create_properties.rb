class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_view :properties
  end
end
