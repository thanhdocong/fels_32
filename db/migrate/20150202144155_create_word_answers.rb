class CreateWordAnswers < ActiveRecord::Migration
  def change
    create_table :word_answers do |t|
      t.string :content
      t.boolean :correct
      t.references :word, index: true

      t.timestamps
    end
  end
end
