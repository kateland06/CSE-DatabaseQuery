json.array!(@program_educational_objectives) do |program_educational_objective|
  json.extract! program_educational_objective, :id, :accredidation_body, :title, :description, :year_added, :active, :correct_answers, :incorrect_answers, :temp_correct_answer, :temp_incorrect_answer
  json.url program_educational_objective_url(program_educational_objective, format: :json)
end
