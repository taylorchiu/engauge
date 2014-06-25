class LessonsController < ApiController
	include LessonsHelper
	# # authorize the user before loading lesson
	# before_filter :check_lesson_owner, only: [] 
	
	# use a private method to load the desired lesson
	before_action :set_lesson, only: [:show, :update, :destroy]
	before_action :check_lesson_owner, only: [:update, :destroy]

	respond_to :json, :html



	def index
		respond_with Lesson.all
	end

	def create
		@lesson = Lesson.new(lesson_params)
		@lesson.access_code = SecureRandom.urlsafe_base64(5)
		@lesson.url = SecureRandom.urlsafe_base64(16)
		@lesson.save
		respond_with @lesson
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
			Lesson.find_by(url: params[:id]) ? @lesson = Lesson.find_by(url: params[:id]) : @lesson = Lesson.find(params[:id])
		end

		def check_lesson_owner
#      raise "Not your lesson" unless @lesson.user_id == current_user.try :id
		end

		def lesson_params
			params.require(:lesson).permit(:name, :expiration, :date, :limit)
		end
end
