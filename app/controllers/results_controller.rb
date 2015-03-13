class ResultsController < ApplicationController
  before_action :logged_in_user, only:[:index,:show]

  def show
    @lesson_result = Lesson.find params[:id]
  end

  def index
    @lesson_results = current_user.lessons.order_by_created_date.paginate page: params[:page], 
                                 per_page: 10
  end
end
