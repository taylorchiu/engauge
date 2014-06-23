class StaticPagesController < ApplicationController
	def home
	end

	def home_template
		render :home_template, layout: false
	end
end
