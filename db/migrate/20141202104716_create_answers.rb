class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :question, index: true
      t.references :section, index: true
      t.references :student, index: true
      t.references :knowledge_topic, index: true
      t.boolean :is_correct
      t.string :answer_text

      t.timestamps
    end
  end
end
