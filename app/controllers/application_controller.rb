class ApplicationController < ActionController::Base
  
  def find_user
    @user = User.find_by(id: session[:user_id]) if session[:user_id]
  end
  
end
