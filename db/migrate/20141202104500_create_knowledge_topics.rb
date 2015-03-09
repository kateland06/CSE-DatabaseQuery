class CreateKnowledgeTopics < ActiveRecord::Migration
  def change
    create_table :knowledge_topics do |t|
      t.string :knowledge_area
      t.string :knowledge_unit
      t.string :knowledge_topic
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
