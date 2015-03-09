class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question_text
      t.string :answer
      t.date :date_created
      t.string :creator
      t.boolean :active
      t.integer :correct_answers
      t.integer :incorrect_answers
      t.integer :temp_correct_answer
      t.integer :temp_incorrect_answer

      t.timestamps
    end
  end
end
