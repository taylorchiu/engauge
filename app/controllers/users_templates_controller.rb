class UsersTemplatesController < ApplicationController

	layout :false
	def new
		@user = User.new
	end


end
