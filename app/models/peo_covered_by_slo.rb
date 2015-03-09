class PeoCoveredBySlo < ActiveRecord::Base
  belongs_to :student_learning_outcome
  belongs_to :program_educational_objective
end
