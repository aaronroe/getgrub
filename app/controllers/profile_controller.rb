class ProfileController < ApplicationController

	layout "internals"
	before_filter :require_login

	def profile
	end

  def balance
    @user = User.new(params[:user])
  end
  
  def phone_number
    @user = User.new(params[:user])
  end

  def update_balance
    @user = current_user

    respond_to do |format|
      current_balance = @user.balance

      if @user.update_attribute("balance", Integer(params[:user]["balance"]) + current_balance)
        format.html { redirect_to profile_balance_path, notice: 'Balance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_phone_number
    @user = current_user

    respond_to do |format|
      if @user.update_attribute("phone_number", params[:user]["phone_number"])
        format.html { redirect_to profile_phone_number_path, notice: 'Phone number was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

end
