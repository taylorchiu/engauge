class EngaugeTemplatesController < ApplicationController
	before_action :authorize_user, :except => [:student]
	
 	layout :false
 	
 	def index
 	end

 	def student
 	end

 	def show
 	end

end
