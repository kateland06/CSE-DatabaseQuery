json.array!(@peo_covered_by_slos) do |peo_covered_by_slo|
  json.extract! peo_covered_by_slo, :id, :student_learning_outcome_id, :program_educational_objective_id
  json.url peo_covered_by_slo_url(peo_covered_by_slo, format: :json)
end
