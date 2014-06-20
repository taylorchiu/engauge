class ChangeUserIdIdAndLessonScoresIdId < ActiveRecord::Migration
  def change
  	rename_column :lessons, :user_id_id, :user_id
  	rename_column :lessons, :lesson_scores_id_id, :lesson_scores_id
  end
end
