class ContentController < ApplicationController
	layout "content_layout"

	def index
		if current_user
			redirect_to home_path
		end


	end

end
