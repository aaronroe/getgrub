class HomeController < ApplicationController
  
  layout "internals"
  before_filter :require_login
	
  def home
    @requests = Request.where(:user_id => current_user.id).all
	end

end