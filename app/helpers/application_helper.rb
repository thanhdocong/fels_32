module ApplicationHelper 

  def logged_in_user      
    unless logged_in?        
      store_location        
      flash[:danger] = "Please log in."        
      redirect_to login_url
    end
  end
  
  def logged_in_user_admin 
    unless logged_in_admin?              
      flash[:danger] = "Please log in."        
      redirect_to admin_login_path
    end
  end
end
