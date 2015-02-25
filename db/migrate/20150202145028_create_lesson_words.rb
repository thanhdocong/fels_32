class CreateLessonWords < ActiveRecord::Migration
  def change
    create_table :lesson_words do |t|
      t.references :lesson, index: true
      t.references :word, index: true
      t.references :word_answer, index: true

      t.timestamps
    end
  end
end
