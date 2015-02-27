class WordsController < ApplicationController
  before_action :logged_in_user, only:[:index]
  
  def index   
  @words = nil  
  @categories = Category.all
      if params[:category_id]
         @category = Category.find params[:category_id] 
         @option = params[:condition]
         case @option     
         when "learned" 
            @words = Word.learned_word current_user,@category
         when "notlearned"                    
            @words = Word.not_learned_word current_user,@category
         when "all"
            @words = @category.words
         end
      end      
  end
 end
