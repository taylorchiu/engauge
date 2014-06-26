class Lesson < ActiveRecord::Base
  belongs_to :user
  has_many :scores
  validates :name, :date, presence: true
end
