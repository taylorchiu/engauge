class ChangeUserIdIdAndLessonScoresIdId < ActiveRecord::Migration
  def change
  	rename_column :lessons, :user_id_id, :user_id
  end
end
