class RegistrationsController < ApplicationController
  def new
    @new_user = User.new
  end

  def create
    @new_user = User.new(registration_params)
    
    if @new_user.save
      flash[:notice] = "User successfully created, please login"
      redirect_to new_login_path 
    else
      flash[:alert] = "Email and/or Password could not be created!"
      render  :new, status: :unprocessable_entity
    end
    
  end

  private
  
  def registration_params
    params.require(:user).permit(:email, :password)
  end
end

