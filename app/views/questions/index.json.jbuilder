json.array!(@questions) do |question|
  json.extract! question, :id, :question_text, :answer, :date_created, :creator, :active, :correct_answers, :incorrect_answers, :temp_correct_answer, :temp_incorrect_answer
  json.url question_url(question, format: :json)
end
