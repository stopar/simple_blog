class RegistrationsController < ApplicationController
  
  before_action :find_user, only: [:new]
  
  def new
    redirect_to root_path if @user
    @user = User.new
  end

  def create
    @user = User.new(registration_params)
    @user.name = @user.email[/[^@]+/]
    
    if @user.save
      flash[:notice] = "User successfully created, please login"
      redirect_to new_login_path 
    else
      flash[:alert] = "Email and/or Password could not be created!"
      render  :new, status: :unprocessable_entity
    end
    
  end

  private
  
  # def find_user
  #   @existing_user = User.find_by(id: session[:user_id])
  # end
  
  def registration_params
    params.require(:user).permit(:email, :password)
  end
end

