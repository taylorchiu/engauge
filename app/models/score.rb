class Score < ActiveRecord::Base
  belongs_to :session
  has_one :lesson, through :lesson_scores
  has_one :comment
end
