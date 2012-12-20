class ProfileController < ApplicationController

	layout "internals"
	before_filter :require_login

	def profile
	end

  def balance
    @user = current_user
  end

  def update
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

end
