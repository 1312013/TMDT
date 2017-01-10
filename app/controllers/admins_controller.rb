class AdminsController < ApplicationController
	before_action :require_admin, only: [:create, :new]
  def index
  end

  def new
  	@admin = Admin.new
  end

  def show
  	@admin = Admin.find(session[:user_id])
  end

  def create
  	 @admin = Admin.new(user_params)
	
	 if @admin.save
    flash[:success] = "Success!"
	 	render 'admins/index'
	 	
	 else
    #flash[:danger] = "Sign up fail!"
	 	render 'new'
	 	
	 end
  end

  def require_admin
  	if !user_admin? 
      flash[:danger] = "You cannot sign up!"
  		redirect_to admins_path
  		
		
  	end
  end
  def user_params
	params.require(:admin).permit(:name,:password)
  end
  
end
