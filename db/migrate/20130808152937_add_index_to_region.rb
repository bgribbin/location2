class AddIndexToRegion < ActiveRecord::Migration
  def change
  	change_table :regions do |t|
      t.index :poly, :spatial => true
  end
  end
end
