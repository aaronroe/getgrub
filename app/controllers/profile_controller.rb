class ProfileController < ApplicationController

	layout "internals"
	before_filter :require_login

	def profile
	end

end
