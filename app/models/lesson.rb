class Lesson < ActiveRecord::Base  
  has_many :lesson_words , dependent: :destroy   
  belongs_to :user  
  belongs_to :category  
  validates :user_id, presence: true  
  validates :category_id, presence: true
  accepts_nested_attributes_for :lesson_words

  scope :order_by_created_date,-> { order("created_at DESC") }

  scope :user_lesson,->user_id{where("user_id = ?", user_id).order_by_created_date}
end
