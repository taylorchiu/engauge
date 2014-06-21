class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.float :score
      t.references :lesson, index: true
      t.references :comment, index: true

      t.timestamps
    end
  end
end
