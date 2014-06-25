class Lesson < ActiveRecord::Base
  belongs_to :user_id
  has_many :scores
  validates :name, :date, presence: true
end
