class KnowledgeTopic < ActiveRecord::Base
  has_many :answers
  has_many :slo_covered_by_kts 
  has_many :student_learning_outcomes, through: :slo_covered_by_kts
end
