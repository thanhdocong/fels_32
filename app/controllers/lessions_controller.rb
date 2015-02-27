class LessonsController < ApplicationController
before_action :logged_in_user, only:[:create,:show,:update]

  def create  
    category = Category.find params[:category_id] 
    words = category.words.order("RAND()").limit 20 
    @lesson = Lesson.new(user_id:current_user.id,category_id:category.id)
    words.each do |word|
      @lesson.lesson_words.build word_id: word.id, word_answer_id: 0
    end
    if @lesson.save               
      redirect_to @lesson
    else
      flash[:danger] = "Can not start the lesson!"
      redirect_to @lesson.category
    end    
  end
  
  def show
    @lesson = Lesson.find params[:id]
  end

  def index
    @lessons = current_user.lessons.order_by_created_date.paginate page: params[:page], 
                                    per_page: 10
  end

  def update
    @lesson = Lesson.find params[:id]
    if @lesson.update_attributes lesson_params   
      flash[:success] = "Finish!"   
      @lesson.update_columns result:@lesson.lesson_words.correct_answers.count      
      redirect_to result_path @lesson
    else
      render "show"
    end       

  end

  private 

  def lesson_params
    params.require(:lesson).permit :id, lesson_words_attributes: [:id, :word_answer_id]
  end
end
