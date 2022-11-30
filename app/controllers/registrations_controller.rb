class RegistrationsController < ApplicationController
  def new
    @new_user = User.new
  end

  def create
    @new_user = User.new(registration_params)
    
    
    
  end

  private
  
  def registration_params
    params.require(:registration).permit(:email, :password)
  end
end

