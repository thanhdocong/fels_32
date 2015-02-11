class WordAnswer < ActiveRecord::Base
  belongs_to :word  
  belongs_to :lesson_word  
  validates :content, presence: true
  
  scope :correct ,-> {
    WordAnswer.find_by correct: true
  }  
end