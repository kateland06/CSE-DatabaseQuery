json.array!(@answers) do |answer|
  json.extract! answer, :id, :question_id, :section_id, :student_id, :knowledge_topic_id, :is_correct, :answer_text
  json.url answer_url(answer, format: :json)
end
