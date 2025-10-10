class CreateBoulders < ActiveRecord::Migration[6.0]
  def change
    create_table :boulders do |t|
      # t.st_polygon :polygon, geographic: true, srid: 4326
      t.geography :polygon, geographic: true, srid: 4326, type: "polygon"
      t.timestamps
    end
  end
end
