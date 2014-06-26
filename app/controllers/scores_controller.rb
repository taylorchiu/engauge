class ScoresController < ApiController

	respond_to :json, :html

	def index
		@lesson = Lesson.find(params[:lesson_id])
		@scores = @lesson.scores
		respond_with @scores
	end

	def show
		@lesson = Lesson.find_by(url: params[:url])
		respond_with @lesson
	end

	def create
		@lesson = Lesson.find(params[:lesson_id])
		@score = @lesson.scores.create(score_params)
		respond_with @score, location: nil
		# location:nil prevents rails magic from trying to create a score_url and throwing an error:
		# see https://github.com/rails/rails/issues/8422 for more info
	end

	private
		def score_params
			params.require(:score).permit(:timestamp, :score, :lesson_id)
		end

end
