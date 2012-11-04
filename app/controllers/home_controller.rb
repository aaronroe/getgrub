class HomeController < ApplicationController
	
  def home
    @requests = Request.where(:user_id => current_user.id).all
	end

end