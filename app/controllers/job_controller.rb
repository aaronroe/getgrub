class JobController < ApplicationController

  layout "internals"
  before_filter :require_login

	def job
    @requests = Request.where(:isOpen => true).all 
	end

end
