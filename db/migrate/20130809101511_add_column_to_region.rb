class AddColumnToRegion < ActiveRecord::Migration
  def change
    add_column :regions, :multi, :multi_polygon
  end
end
