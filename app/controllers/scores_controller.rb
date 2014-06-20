class ScoresController < ApplicationController
	before_action :render_main_layout_if_format_html

	respond_to :json, :html
	layout :false

	def index
	end

	def show
		@lesson = Lesson.find(params[:url])
		respond_with @lesson
	end

	private
		def score_params
			params.require(:lesson).permit(:timestamp, :score, :session_id, :lesson_id)
		end

		def render_main_layout_if_format_html
			# check the request format
			if request.format.symbol == :html
				render "layouts/application"
			end
		end

end
