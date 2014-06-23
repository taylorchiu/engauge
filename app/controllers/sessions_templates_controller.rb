class SessionsTemplatesController < ApplicationController
	layout :false
	def new
		@user = User.new
	end

	def sign_in
	end
end
