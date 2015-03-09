json.array!(@students) do |student|
  json.extract! student, :id, :w_number, :last_name, :first_name, :gender, :ethnicity, :high_school_gpa, :act, :mpl, :act_math
  json.url student_url(student, format: :json)
end
