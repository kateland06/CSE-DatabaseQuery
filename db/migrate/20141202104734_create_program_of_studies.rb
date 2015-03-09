class CreateProgramOfStudies < ActiveRecord::Migration
  def change
    create_table :program_of_studies do |t|
      t.string :program
      t.references :section, index: true

      t.timestamps
    end
  end
end
