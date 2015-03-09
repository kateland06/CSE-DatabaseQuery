json.array!(@prerequisites) do |prerequisite|
  json.extract! prerequisite, :id, :section_id, :student_id, :course, :year_taken, :faculty, :semester
  json.url prerequisite_url(prerequisite, format: :json)
end
