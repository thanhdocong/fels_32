class Admin::WordsController < ApplicationController
  before_action :logged_in_user_admin, only: [:index, :edit, :update, :destroy, :show]  
  before_action :admin_user, only: [:index, :edit, :update, :destroy, :show]    

  def new    
    @categories = Category.all  
    @word = Word.new
    4.times.each do
      @word.word_answers.build
    end     
    @test = @word.word_answers.count     
  end

  def create
    @word = Word.new word_params            
    if @word.save        
      flash[:success] = "Word #{@word.content} created!"        
      render "show"
    else 
      @categories = Category.all  
      render "new"
    end
  end

  def edit
    @word = Word.find params[:id]
    @categories = Category.all
  end

  def update
    @word = Word.find params[:id]     
    if @word.update_attributes word_params            
      render "show"
    else      
      @categories = Category.all
      render "edit"
    end 
  end

  def show
    @word = Word.find params[:id]
  end

  def index
    @words = Word.order_by_created_date.paginate page: params[:page], per_page: 20
  end

  def destroy
    word = Word.find params[:id]    
    flash[:success] = "Word #{word.content} delete"    
    word.destroy
    redirect_to admin_words_url
  end

  private
  def word_params
    params.require(:word).permit :id, :content, :category_id, 
                                 word_answers_attributes: [:id, :content,:correct]
  end

  def admin_user
      redirect_to admin_root_url unless current_user.isadmin?            
  end
end
