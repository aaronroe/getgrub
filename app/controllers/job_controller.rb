class JobController < ApplicationController

  layout "internals"
  before_filter :require_login

  require "pp"

	def job
    	@requests = Request.where(:isOpen => true).all 
    	@jobs = Job.where(:user_id => current_user.id).all
    	@job = Job.new(:user_id => current_user.id)
	end


  # POST /job
  # POST /job.json
  def new
    @jobs = Job.new(params[:accepted_jobs])

    @jobs.user_id = current_user.id

    pp @jobs

    # respond_to do |format|
    #   if @jobs.save
    #     format.html { redirect_to home_path, notice: 'Request was successfully created.' }
    #     format.json { render json: @jobs, status: :created, location: home_path }
    #   else
    #     format.html { render action: "new" }
    #     format.json { render json: @jobs.errors, status: :unprocessable_entity }
    #   end
    # end
  end
end
