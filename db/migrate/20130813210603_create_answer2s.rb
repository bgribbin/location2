class CreateAnswer2s < ActiveRecord::Migration
  def change
    create_table :answer2s do |t|
      t.point :coords, :srid => 4326

      t.timestamps
    end
  end
end
