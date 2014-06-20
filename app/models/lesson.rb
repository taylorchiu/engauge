class Lesson < ActiveRecord::Base
  belongs_to :user_id
  belongs_to :lesson_scores_id

  validates :name, :limit, presence: true
end
