class CreatePrerequisites < ActiveRecord::Migration
  def change
    create_table :prerequisites do |t|
      t.references :section, index: true
      t.references :student, index: true
      t.string :course
      t.integer :year_taken
      t.string :faculty
      t.string :semester

      t.timestamps
    end
  end
end
