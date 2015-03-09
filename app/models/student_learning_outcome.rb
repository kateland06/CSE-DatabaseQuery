class StudentLearningOutcome < ActiveRecord::Base
  has_many :peo_covered_by_slos
  has_many :program_educational_objectives, through: :peo_covered_by_slos
  has_many :slo_covered_by_kts 
  has_many :knowledge_topics, through: :slo_covered_by_kts

end
