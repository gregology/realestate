class UpdatePropertiesToVersion6 < ActiveRecord::Migration[6.0]
  def change
    update_view :properties, version: 6, revert_to_version: 5
  end
end
