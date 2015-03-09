class CreateStudentLearningOutcomes < ActiveRecord::Migration
  def change
    create_table :student_learning_outcomes do |t|
      t.string :accredidation_body
      t.string :title
      t.string :description
      t.integer :year_added
      t.boolean :active
      t.integer :correct_answers
      t.integer :incorrect_answers
      t.integer :temp_correct_answer
      t.integer :temp_incorrect_answer

      t.timestamps
    end
  end
end
