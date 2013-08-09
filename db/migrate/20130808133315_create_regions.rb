class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.polygon :poly

      t.timestamps
    end
  end
end
