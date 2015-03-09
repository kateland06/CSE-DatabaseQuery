json.array!(@student_learning_outcomes) do |student_learning_outcome|
  json.extract! student_learning_outcome, :id, :accredidation_body, :title, :description, :year_added, :active, :correct_answers, :incorrect_answers, :temp_correct_answer, :temp_incorrect_answer
  json.url student_learning_outcome_url(student_learning_outcome, format: :json)
end
