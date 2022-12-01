class LoginsController < ApplicationController
  
  before_action :find_user, only: [:new]
  
  def new
    redirect_to root_path if @user
    @user = User.new
  end

  def create
    @user = User.find_by(login_params)
    
    if @user
      flash[:notice] = "Welcome back!"
      session[:user_id] = @user.id
      redirect_to posts_path
    else
      flash[:alert] = "Email and/or Password is incorrect!"
      render  :new, status: :unprocessable_entity
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:notice] = "Goodbye, have a great day"
    redirect_to root_path
  end

  
  private
  
  def login_params
    params.require(:user).permit(:email, :password)
  end
end
