class AddIndexToAnswers < ActiveRecord::Migration
  def change
  add_column :answers, :region_id, :integer
  add_index :answers, :region_id
  end
end
