class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.integer :course_registration_number
      t.string :faculty
      t.string :course
      t.string :semester
      t.integer :year_offered
      t.integer :section
      t.references :student, index: true
      t.string :academic_progress
      t.string :grade
      t.float :quiz_score

      t.timestamps
    end
  end
end
