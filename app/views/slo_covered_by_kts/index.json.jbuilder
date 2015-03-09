json.array!(@slo_covered_by_kts) do |slo_covered_by_kt|
  json.extract! slo_covered_by_kt, :id, :student_learning_outcome_id, :knowledge_topic_id
  json.url slo_covered_by_kt_url(slo_covered_by_kt, format: :json)
end
