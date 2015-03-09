class CreateSloCoveredByKts < ActiveRecord::Migration
  def change
    create_table :slo_covered_by_kts do |t|
      t.references :student_learning_outcome, index: true
      t.references :knowledge_topic, index: true

      t.timestamps
    end
  end
end
