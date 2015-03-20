class Admin::SessionsController < ApplicationController
  def new    
  end

  def create    
    user = User.find_by(email: params[:session][:email].downcase)            
    if user && user.authenticate(params[:session][:password]) && user.isadmin    
      log_in user     
      params[:session][:remember_me] == "1" ? remember(user) : forget(user)             
      redirect_to admin_root_path
    else
      flash[:danger] = "Invalid email/password combination"
      render "new"
    end    
  end

  def destroy     
    log_out if logged_in?   
    redirect_to admin_login_path  
  end
end
