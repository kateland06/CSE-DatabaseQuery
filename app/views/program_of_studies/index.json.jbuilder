json.array!(@program_of_studies) do |program_of_study|
  json.extract! program_of_study, :id, :program, :section_id
  json.url program_of_study_url(program_of_study, format: :json)
end
