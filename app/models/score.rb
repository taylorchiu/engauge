class Score < ActiveRecord::Base
  belongs_to :session
  belongs_to :lesson
  has_one :comment
end
