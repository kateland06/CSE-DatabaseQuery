class CreatePeoCoveredBySlos < ActiveRecord::Migration
  def change
    create_table :peo_covered_by_slos do |t|
      t.references :student_learning_outcome, index: true
      t.references :program_educational_objective, index: true

      t.timestamps
    end
  end
end
