class LessonWord < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :word
  belongs_to :word_answer  
  
  validates :word_id, presence: true  
  validates :word_answer_id, presence: true  
  
  scope :in_category,-> category{
  	where(lesson_id: Lesson.select(:id).where(category_id:category.id))
  }

  scope :correct_answers,->{
  	where word_answer_id: WordAnswer.where(correct: true)  
  }

  scope :user_lesson_words,->user_id{
    select(:word_id).where(lesson_id: Lesson.select(:id).where(user_id:user_id))
  }
end
