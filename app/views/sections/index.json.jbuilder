json.array!(@sections) do |section|
  json.extract! section, :id, :course_registration_number, :faculty, :course, :semester, :year_offered, :section, :student_id, :academic_progress, :grade, :quiz_score
  json.url section_url(section, format: :json)
end
