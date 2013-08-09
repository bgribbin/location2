class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.point :coords, :srid => 3785

      t.timestamps
    end
 
  end
end
