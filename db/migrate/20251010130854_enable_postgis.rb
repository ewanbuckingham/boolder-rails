class EnablePostgis < ActiveRecord::Migration[8.0]
  def change
    enable_extension "postgis" unless extension_enabled?("postgis")
    enable_extension "postgis_topology" unless extension_enabled?("postgis_topology")
  end
end
