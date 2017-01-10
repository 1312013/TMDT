class AdminSessionsController < ApplicationController
	def new

	end

	def create
		ad = Admin.find_by(name: params[:admin_session][:name])
		if ad && ad.authenticate(params[:admin_session][:password])
				session[:user_id]= ad.id
				flash[:success] = "successfully log in"
				redirect_to admins_path

		else
			flash[:danger] = "Invalid username or password"
			redirect_to admins_path
			
		end
	end

	def destroy
		session[:user_id]= nil
		flash[:success] = "You have logged out"
		render 'admins/index'
	end
	private def ad_params
		params.require(:admin_session).permit(:name, :password)

	end


end
