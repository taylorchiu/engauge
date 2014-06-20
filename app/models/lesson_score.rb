class LessonScore < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :score
end
