class RequestsController < ApplicationController

  layout "internals"
  before_filter :require_login
  require 'pp'


  # GET /requests/new
  # GET /requests/new.json
  def new
    @request = Request.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @request }
    end
  end

  # GET /requests/1/edit
  def edit
    @request = Request.find(params[:id])

    if @request.time_min
      time_min_string = @request.time_min
      min_strings = time_min_string.to_s().split(' ');
      time_min_date_string, time_min_hhmm_string = min_strings;

      @request.time_min_date = time_min_date_string;
      @request.time_min_hhmm = time_min_hhmm_string;
    end

    if @request.time_max
      time_max_string = @request.time_max
      max_strings = time_max_string.to_s().split(' ');
      time_max_date_string, time_max_hhmm_string = max_strings;

      @request.time_max_date = time_max_date_string;
      @request.time_max_hhmm = time_max_hhmm_string;
    end

  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(params[:request])

    @request.user_id = current_user.id
    @request.isOpen = true

    respond_to do |format|
      if @request.save
        format.html { redirect_to home_path, notice: 'Request was successfully created.' }
        format.json { render json: @request, status: :created, location: home_path }
      else
        format.html { render action: "new" }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /requests/1
  # PUT /requests/1.json
  def update
    @request = Request.find(params[:id])

    respond_to do |format|
      if @request.update_attributes(params[:request])
        format.html { redirect_to home_path, notice: 'Request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request = Request.find(params[:id])
    @request.destroy

    respond_to do |format|
      format.html { redirect_to home_path }
      format.json { head :no_content }
    end
  end
end
