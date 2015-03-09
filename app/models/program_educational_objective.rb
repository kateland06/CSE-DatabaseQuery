class ProgramEducationalObjective < ActiveRecord::Base
  has_many :peo_covered_by_slos
  has_many :student_learning_outcomes, through: :peo_covered_by_slos
end