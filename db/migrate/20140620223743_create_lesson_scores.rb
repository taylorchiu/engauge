class CreateLessonScores < ActiveRecord::Migration
  def change
    create_table :lesson_scores do |t|
      t.references :lesson, index: true
      t.references :score, index: true

      t.timestamps
    end
  end
end
