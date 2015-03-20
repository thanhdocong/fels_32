class Admin::CategoriesController < ApplicationController  
  before_action :logged_in_user_admin, only:[:index, :edit, :update,:destroy, :show]  
  before_action :admin_user, only:[:index, :edit, :update,:destroy, :show]  

  def new    
    @category = Category.new
  end
  
  def create
    @category = Category.new category_params    
    if @category.save                   
      flash[:success] = "Category #{@category.name}created!"        
      render "show"
    else 
      render "new"
    end
  end

  def index    
    @categories = Category.order_by_created_date.paginate page: params[:page], per_page: 10    
  end

  def show
    @category = Category.find params[:id]
    @words = @category.words.order_by_created_date
    @words = @paginate page: params[:page], per_page: 20    
  end

  def edit
    @category = Category.find params[:id]
  end

  def update
    @category = Category.find params[:id]    
    @words = @category.words.order_by_created_date
                      .paginate page: params[:page], per_page: 20    
    if @category.update_attributes category_params      
      flash[:success] = "Category update"      
      render "show"
    else      
      render "edit"
    end
  end

  def destroy
    category = Category.find params[:id]    
    flash[:success] = "Category #{category.name} delete"    
    category.destroy
    redirect_to admin_categories_url
  end

  private    
  def category_params
    params.require(:category).permit :name,:description
  end    
  
  def admin_user
    redirect_to admin_root_url unless current_user.isadmin?            
  end
end
