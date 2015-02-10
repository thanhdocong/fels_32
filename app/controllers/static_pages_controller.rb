class StaticPagesController < ApplicationController

  def home  	
    if logged_in?  	 	
      @lesson  = current_user.lessons.build      
      @activity_lessons = current_user.activity.paginate(page: params[:page])
    end
  end  
end
