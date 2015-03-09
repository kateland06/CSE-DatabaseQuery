class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :w_number
      t.string :last_name
      t.string :first_name
      t.string :gender
      t.string :ethnicity
      t.float :high_school_gpa
      t.integer :act
      t.integer :mpl
      t.integer :act_math

      t.timestamps
    end
  end
end
