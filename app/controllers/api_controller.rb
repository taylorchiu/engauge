class ApiController < ApplicationController

	# return the template without the layout
	before_action :render_main_layout_if_format_html


	def render_main_layout_if_format_html
		# check the request format
		if request.format.symbol == :html
			render  "pages/index"
		end
	end

end