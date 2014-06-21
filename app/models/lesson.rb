class Lesson < ActiveRecord::Base
  belongs_to :user_id
  has_many :scores, through: :lesson_scores

  validates :name, :limit, presence: true
end
