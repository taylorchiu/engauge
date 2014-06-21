class ScoresController < ApplicationController
	before_action :render_main_layout_if_format_html

	respond_to :json, :html
	layout :false

	def index
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

		def render_main_layout_if_format_html
			# check the request format
			if request.format.symbol == :html
				render "layouts/application"
			end
		end

end
