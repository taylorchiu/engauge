class LessonsController < ApplicationController

	# use a private method to load the desired lesson
	before_action :set_lesson, only: [:show, :update, :destroy]

	# return the template without the layout
	before_action :render_main_layout_if_format_html

	respond_to :json, :html

	layout :false

	def index
		respond_with Lesson.all
	end

	def create
		respond_with Lesson.create(lesson_params)
	end

	def show
		respond_with @lesson
	end

	def update
		respond_with @lesson.update(lesson_params)
	end

	def destroy
		respond_with @lesson.destroy
	end

	private
		def set_lesson
			@lesson = Lesson.find(params[:id])
		end

		def lesson_params
			params.require(:lesson).permit(:name, :expiration, :limit)
		end

		def render_main_layout_if_format_html
			# check the request format
			if request.format.symbol == :html
				render "layouts/application"
			end
		end
end
