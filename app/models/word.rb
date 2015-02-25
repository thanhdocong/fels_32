class Word < ActiveRecord::Base
  belongs_to :category  
  has_many :word_answers , dependent: :destroy
  validates :content, presence: true
  validates :category_id, presence: true
  accepts_nested_attributes_for :word_answers
    
  scope :order_by_created_date,-> { order("created_at DESC")}

  scope :learned_word, -> (user, category) {
    word_id_query = LessonWord.select("word_id")
      .where(lesson_id: Lesson.select("id").where(user_id: user.id))
      .to_sql
    where("id IN (#{word_id_query}) AND category_id = #{category.id}")
  }

  scope :not_learned_word, -> (user, category) {
   word_id_query = LessonWord.select("word_id")
      .where(lesson_id: Lesson.select("id").where(user_id: user.id))
      .to_sql
    where("id NOT IN (#{word_id_query}) AND category_id = #{category.id}") 
  } 

end
